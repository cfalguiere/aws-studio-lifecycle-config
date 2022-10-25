#!/bin/bash
# creates a LLC in Studio for Iris

set -eux

SCRIPT_DIR=$(dirname "$0")
echo "SCRIPT_DIR=${SCRIPT_DIR}"

CMD="${SCRIPT_DIR}/add-lcc-script-venv.sh"

$CMD iris eu-west-3
