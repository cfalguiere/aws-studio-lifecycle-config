#!/bin/bash
# Generic
# clone the env details and create the env
# Run by the LCC

set -eux
programname=$0

echo "cloning $SUBST_ENV_URL in env-$SUBST_ENV_NAME"
git clone "$1" "env-${SUBST_ENV_NAME}" || { printf '%s\n' "cloning failed" >&2; exit 1; }

# setup the required env
conda env create -f "env-${SUBST_ENV_NAME}/venv-config/conda-env.yml" --verbose

# activate the required env
conda activate $0
