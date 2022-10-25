## purpose

create a LCC for a venv in a generic manner

## how to use the scripts

clone this repo

run add-lcc-iris.sh

you should see the LCC in the SageMaker Console under SageMaker dashboard / LifeCycle Configuration

you must attach the LCC to the domain or user for it to show up in the notebook staturp menu
- in Studio's Control Panel, 
- section images/lifecycle configuration
- select the tab lifecycle configuration and attach the LCC

attach to a user 
- to into user details, click Edit, go to section lifecycle configuration

## Debug and tests
- run add-lcc-iris in a terminal (you may want to remove the aws cli command)
- go to the build folder and test the script locally
- attach the LCC to the domain
- Enter the studio and start a notebook, choose the LCC in the dropdown list
- check env is created
- check repo has been copied onto the user home
- use in notebook: jupyter kernelspec list

Log group /aws/sagemaker/studio esp. Gateway

## Clean up 

conda env remove --name iris
rm -rf env-iris
delete the LCC in SageMaker dashboard (attachements will be removed)
