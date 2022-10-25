#!/bin/bash
# Generic
# clone the env details and create the env
# Run by the LCC

set -eux

echo "cloning https://github.com/cfalguiere/aws-studio-lifecycle-config-for-iris.git in env-iris"
git clone "https://github.com/cfalguiere/aws-studio-lifecycle-config-for-iris.git" "/home/sagemaker-user/env-iris" || { printf '%s\n' "cloning failed" >&2; exit 1; }

# setup the required env
conda env create -f "/home/sagemaker-user/env-iris/venv-config/conda-env.yml" --verbose

# activate the required env
conda activate "iris"
