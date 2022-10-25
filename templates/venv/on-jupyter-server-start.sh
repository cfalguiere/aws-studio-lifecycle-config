#!/bin/bash
# Generic
# clone the env details and create the env
# Run by the LCC

set -eux

echo "cloning $SUBST_ENV_URL in env-$SUBST_ENV_NAME"
git clone "$SUBST_ENV_URL" "${HOME}/env-${SUBST_ENV_NAME}" || { printf '%s\n' "cloning failed" >&2; exit 1; }

# setup the required env
conda env create -f "${HOME}/env-${SUBST_ENV_NAME}/venv-config/conda-env.yml" --verbose

# activate the required env
conda activate "$SUBST_ENV_NAME"
