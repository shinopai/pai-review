#!/bin/bash
set -e

rm -f /pai-review/tmp/pids/server.pid

exec "$@"
