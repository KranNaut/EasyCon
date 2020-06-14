# EasyCon

A Template to accelerate
- Containerization of your Java Application
- Deploying the image to docker hub
- Setting up a kubernetes cluster with master and worker nodes
- Deploy the container to the cluster



# To Cotainerize the application we have used Github actions 
1. Create the [Dockerfile](https://github.com/KranNaut/EasyCon/blob/master/Dockerfile) to your projects root folder
2. Go to your Github Repo and click on the actions tab:

![](https://github.com/KranNaut/EasyCon/blob/master/screenshots/action.png)

3. Click on the new workflow button. This will create a new yaml file under .github/workflows

4. Copy the contents of [docker.yaml](https://github.com/KranNaut/EasyCon/blob/master/docker.yaml) file 

5. Edit the name from project:version to the name of your project

6. Create Two new secrets, DOCKER_USER and DOCKER_PASSWORD with the username and password of your docker hub account.

What this action file does is, Everytime you push something to the repo it creates a docker image and push it to the docker hub so we can later pull it for our kubernetes pod.


# Setting up Kubernetes Cluster

We will use ansible to setup the kubernetes cluster, So you first need to install ansible in your controller server.
Once you have installed, ansilbe clone the Easycon repo.
In the kube_ans_setup folder, you will find a hosts file. Change the ip of master node and worker node to your ips(you can add more nodes if you want).
You also need to change master node advertise ip and cidr range for pods in the [env_variables](https://github.com/KranNaut/EasyCon/blob/master/Kube_Ans_Setup/env_variables) file

Then make the setting_deploy.sh as executable and run it.
This will setup the nodes and make the worker nodes join the cluster.

Wait for a few minutes for the worker nodes to join.
Make the neccesary changes in [deployment.yml](https://github.com/KranNaut/EasyCon/blob/master/deployment.yml) use the following command at master node

```shell
kubectl apply -f deployment.yml
```