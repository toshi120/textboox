#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid
rm -f /myapp/tmp/pids/unicorn.pid
# Then exec the container's main process (what's set as CMD in the Dockerfile).

# if [ "${RAILS_ENV}" = "production"]
# then
#   bundle exec rails assets:precompile
# fi

exec "$@"