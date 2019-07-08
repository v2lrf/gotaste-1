#!/usr/bin/env bash
set -e

mkdir -p /tmp/database
time curl -o /tmp/database/latest.dump `heroku pg:backups public-url -a gotaste-new-world`
time pg_restore --verbose --clean --no-acl --jobs 8 --no-owner -h localhost -d gotaste_new_development /tmp/database/latest.dump
psql -h localhost -d gotaste_new_development -c "UPDATE ar_internal_metadata SET value = 'development' WHERE key = 'environment'"
