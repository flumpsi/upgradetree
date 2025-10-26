#!/bin/sh
printf '\033c\033]0;%s\a' upgradetree
base_path="$(dirname "$(realpath "$0")")"
"$base_path/upgradetree.x86_64" "$@"
