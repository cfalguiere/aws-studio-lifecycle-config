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

python -m venv "${HOME}/.virtualenvs/${SUBST_ENV_NAME}"  

source "${HOME}/.virtualenvs/${SUBST_ENV_NAME}/bin/activate" 

which python

python --version

"${HOME}/.virtualenvs/${SUBST_ENV_NAME}/bin/python" -m pip install --upgrade pip

# setup the required env
pip install -r "${HOME}/env-${SUBST_ENV_NAME}/venv-config/requirements.txt" 


# register as Jupyter kernel with the name of this env
python -m ipykernel install --user --name="${SUBST_ENV_NAME}"

