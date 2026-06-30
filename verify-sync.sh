#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "$0")" && pwd)"
source_file="$repo_root/packs/hello.zopack.md"
mirror_file="/home/workspace/code/github.com/EthanThatOneKid/setup-zo-poc-mirror/demo/hello.zopack.md"

printf 'source: %s\n' "$source_file"
printf 'mirror: %s\n' "$mirror_file"

if [ ! -f "$mirror_file" ]; then
  echo 'mirror file missing'
  exit 1
fi

if cmp -s "$source_file" "$mirror_file"; then
  echo 'sync verified: source and mirror match'
else
  echo 'sync mismatch: source and mirror differ'
  diff -u "$source_file" "$mirror_file" || true
  exit 1
fi

printf 'source mtime: '
stat -c '%y' "$source_file"
printf 'mirror mtime: '
stat -c '%y' "$mirror_file"
