#!/usr/bin/env bash
set -e

printf 'SecureCloud Enterprise - local tool check\n'
pwd

for tool in git python3 "$@"; do
	if command -v "$tool" >/dev/null 2>&1; then
		printf 'OK: %s\n' "$tool"
	else
		printf 'ERROR: required tool missing: %s\n' "$tool" >&2
		exit 1
	fi
done
