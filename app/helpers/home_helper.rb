module HomeHelper
  def show_url(url)
    if Rails.env.production?
      'https://m.media-amazon.com/images' + url
    else
    'https://m.media-amazon.com/images/P/' + url
    end
  end
end
