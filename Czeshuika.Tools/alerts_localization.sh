#!/bin/bash
# vi: set tabstop=4 shiftwidth=4 noexpandtab :
SCRIPT_DIR=$(cd "$(dirname "$0")" &>/dev/null && pwd)

if [[ "$1" == "build" ]]; then
    echo "--- BUILD TOOLS ---"
    cd "$SCRIPT_DIR"/src
    pnpm run build
    exit 0
fi

node "$SCRIPT_DIR"/src/out alerts_localization --workdir="$(pwd)" $@
