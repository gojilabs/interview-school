#!/bin/sh
set -e

mkdir -p /app/tmp/pids
rake db:create db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"