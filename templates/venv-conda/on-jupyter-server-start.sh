#!/bin/bash
# Generic
# clone the env details and create the env
# Run by the LCC

set -eux



if [ ! -d "${HOME}/env-${SUBST_ENV_NAME}" ] ; then
    echo "cloning $SUBST_ENV_URL in env-$SUBST_ENV_NAME"
    git clone "$SUBST_ENV_URL" "${HOME}/env-${SUBST_ENV_NAME}" || { printf '%s\n' "cloning failed" >&2; exit 1; }
else
    echo "Updating clone in env-$SUBST_ENV_NAME"
    git -C "${HOME}/env-${SUBST_ENV_NAME}" pull 
fi

# setup the required env
# WARNING expects the name given as parameter to be the name in the config file
echo "Creating venv in $SUBST_ENV_NAME"
conda env create -f "${HOME}/env-${SUBST_ENV_NAME}/venv-config/conda-env.yml" --force
# --verbose 

# register as Jupyter kernel
python -m ipykernel install --user --name="${SUBST_ENV_NAME}"

