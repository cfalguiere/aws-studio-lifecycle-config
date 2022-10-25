#!/bin/bash
# Generic
# clone the env details and create the env
# Run by the LCC

set -eux
programname=$0

env_name="lcc-iris"
env_url="https://github.com/cfalguiere/aws-studio-lifecycle-config-for-iris.git"

env_folder="env-iris"
git clone "$1" "" || { printf '%s\n' "cloning  failed" >&2; exit 1; }

# setup the required env
conda env create -f "/venv-config/conda-env.yml" --verbose

# activate the required env
conda activate $0
