#!/bin/sh

export SRC="$(pwd)"

cd "$(dirname "$0")/docker"

COMMAND="${1:-lab}"

make "$COMMAND"
