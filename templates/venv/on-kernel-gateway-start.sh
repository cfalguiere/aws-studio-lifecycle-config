#!/bin/bash
# Generic
# clone the env details and create the env
# Run by the LCC

set -eux

# snoop environemennt
pwd
whoami
# file systems (snoop where efs is mounted)
df -h 

# check prerequisites

[ -d "${SUBST_REPO_NAME}" ] || { printf '%s\n' "project not found" >&2; exit 1; }

[ -f "${SUBST_REPO_NAME}/venv-config/requirements.txt" ] || { printf '%s\n' "requirements not found" >&2; exit 1; }

# creates the venv
python -m venv "/opt/virtualenvs/${SUBST_ENV_NAME}"  

# check the most recent references
"/opt/virtualenvs/${SUBST_ENV_NAME}/bin/python" -m pip install --upgrade pip

# populate the venv with the project requirements
pip install -r "${SUBST_REPO_NAME}/venv-config/requirements.txt" 

# register as Jupyter kernel with the name of this env
python -m ipykernel install --name="${SUBST_ENV_NAME}"

