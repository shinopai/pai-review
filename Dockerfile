FROM ruby:2.7.3

ENV LANG C.UTF-8
ENV DEBCONF_NOWARNINGS yes
ENV NODE_VERSION 14.18.2
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE yes

EXPOSE 3000

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn vim

# Set debian default locale to ja_JP.UTF-8
RUN apt-get update && \
apt-get install -y locales && \
rm -rf /var/lib/apt/lists/* && \
echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
locale-gen ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

# Set MySQL character
RUN { \
echo '[mysqld]'; \
echo 'character-set-server=utf8mb4'; \
echo 'collation-server=utf8mb4_general_ci'; \
echo '[client]'; \
echo 'default-character-set=utf8mb4'; \
} > /etc/mysql/conf.d/charset.cnf

# install node
RUN ARCH= && dpkgArch="$(dpkg --print-architecture)" \
&& case "${dpkgArch##*-}" in \
amd64) ARCH='x64';; \
ppc64el) ARCH='ppc64le';; \
s390x) ARCH='s390x';; \
arm64) ARCH='arm64';; \
armhf) ARCH='armv7l';; \
i386) ARCH='x86';; \
*) echo "unsupported architecture"; exit 1 ;; \
esac \
&& set -ex \
&& curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
&& tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
&& rm "node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
&& ln -s /usr/local/bin/node /usr/local/bin/nodejs \
&& node --version \
&& npm --version

RUN mkdir /pai-review
WORKDIR /pai-review
COPY Gemfile /pai-review/Gemfile
COPY Gemfile.lock /pai-review/Gemfile.lock
RUN bundle install
COPY . /pai-review

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
