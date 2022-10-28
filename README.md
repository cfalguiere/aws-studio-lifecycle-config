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
for a project named iris 
- change the content and name for whatever display name and project folder. it expects the requirements to be under venv-config. this behvior in the template document under templates/venv.
- run add-lcc-iris in a terminal 
```
cd aws-studio-lifecycle-config
b./add-lcc-iris.sh
```
the last line shows the name of the LCC

test in Studio (first time)
- in the SageMaker console attach the LCC to the domain
- Enter the studio and start either start a notebook, or open an existing notebook with Notebooks and change kernel
- when prompted choose the LLC you just created (bottom dropdown). this will setup the venv and kernel. However it is too large to have the kernel added to the drop down.
- when the kernel has started, request to change the kernel and select the kernel (top left drop down) and the LCC (bottomm dropdown) with same version
- check whether some required lib or version is there with package-tester.ipynb


test in Studio (next time)
- Enter the studio and start either start a notebook, or open an existing notebook with Notebooks
- when prompted select the kernel (top left drop down) and the LCC (bottomm dropdown) with same version

if the project's kernel does not show up, user the 'first time" procedure: select the LCC (bottom dropdown) and change kernel to be able to select the kernel and the LCC

list kernels in notebook
```
! jupyter kernelspec list
```


remove unused gateways in Studio and unuser LCCs in the SageMaker Console


## debug and check logs

if the gateway is up and running
- in Studio select the gateway, click the white box and view Logs

directly in CloudWatch:
- Log group /aws/sagemaker/studio esp. */KernelGateway/*


if the script failed and you want to run it locally
- edit script generated under build/ 
- replace /opt/ with /home/sagemaker-user/ and add --user to the ipykernel install
- run the script from the user home (in order to find the project's folder)
```
cd 
bash aws-studio-lifecycle-config/build/script.sh
```


## Clean up 

delete the LCC in SageMaker dashboard (attachements will be removed)
