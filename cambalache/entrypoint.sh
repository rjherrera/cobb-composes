#!/bin/sh
set -eu
yarn migrate
exec "$@"
