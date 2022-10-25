#!/bin/bash
# Generic
# Registers a Lifecycle Configuration Script using the AWS CLI
# Run once manually to create the LCC in Studio 

set -eux

programname=$0

function usage {
    echo "usage: $programname name region"
    exit 1
}

if [$# -ne 2]; 
    then usage
fi

env_name="$1"
lcc_name="lcc-$env_name"
aws_region="$2"

echo "will create a LLC $lcc_name for venv $env_name in region $aws_region"


# initialisations
script_dir=$(dirname "$programname")
echo "script_dir=${script_dir}"

export SCRIPT_TEMPLATE_NAME='templates/venv/on-jupyter-server-start.sh'
# export SCRIPT_TYPE="JupyterServer"
export SCRIPT_TYPE="KernelGateway"

# create a temp dir 
build_dir="${script_dir}/build"
mkdir -p $build_dir

# generate the LCC content document from a template
export SUBST_ENV_NAME="$env_name"
export SUBST_ENV_URL="https://github.com/cfalguiere/aws-studio-lifecycle-config-for-${env_name}.git"
lcc_script_name="${build_dir}/script.sh"

echo "substituting from template $SCRIPT_TEMPLATE_NAME with SUBST_ENV_NAME=$SUBST_ENV_NAME and SUBST_ENV_URL=$SUBST_ENV_URL"
cat "$SCRIPT_TEMPLATE_NAME" | envsubst > $lcc_script_name
echo "generated script ----- BEGIN -----"
cat ${lcc_script_name}
echo "generated script ----- END -----"

# encode the LCC content document
LCC_CONTENT=$( openssl base64 -A -in ${lcc_script_name} )

aws sagemaker --region $aws_region create-studio-lifecycle-config \
  --studio-lifecycle-config-name $lcc_name \
  --studio-lifecycle-config-content $LCC_CONTENT \
  --studio-lifecycle-config-app-type $SCRIPT_TYPE