#!/bin/sh
set -eu

if [ -n "${CONVEX_SELF_HOSTED_ADMIN_KEY:-}" ]; then
	npx convex deploy
else
	echo "CONVEX_SELF_HOSTED_ADMIN_KEY not set, skipping function deploy" >&2
fi

exec node serve.mjs
