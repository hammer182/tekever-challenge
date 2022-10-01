# Tekever Challenge

[API](http://challenge.tekever.maarcoalr.co:5000)

## About this project:

This project was developed locally using Vagrant to provision a virtual machine with all the necessary dependencies. This simple API was developed in python flask language and initial tests were carried out locally. After validating this API I made the Dockerfile to run it in as a container. Using Docker Desktop I created a Kubernetes cluster for the next stage of development. Used manifests: deployment, service and statefulset. Did Jenkins inital setup, user creation and installation of necessary plugins. In this project I used Docker Pipeline and Kubernetes Continuous Deployment. Configured DockerHub and Kubeconfigfile credentials. I created the pipeline and it runs every time the GitHub repository is updated, checks for dependencies, builds the image, uploads it to DockerHub and deploys it to the Kubernetes cluster. Local tests successfully executed, I started the procedures in the cloud, using the AWS Cloud platform.
I created an S3 bucket, hosted zone and IAM User manually. Terraform was the tool used to provision the EC2 instance, the security group, the key pair - generated locally - the VPC, Subnet and Gateway. Provisioning, with bash scripting, also installed the necessary dependencies, Jenkins, Kubectl, Kops, Docker and AWS CLI. In the instance created, I generated the key to be used by all instances of the cluster. Configured the AWS CLI, then created, updated, and validated the cluster. 

## Flowchart

![Flowchart](https://i.imgur.com/OKXxTdm.png)

## Using the API
This is a pretty simple API, developed using Python Flask
```
Access directly or using /user/?user=SOMEARGUMENT (ex: /user/?user=tekever)
```

# Run Locally
Clone this repo to your local machine and use the method of your choice:

## Using Kubernetes 
```
kubectl apply -f deployment-tekever-challenge.yml
kubectl apply -f statefulset-tekever-challenge.yml
kubectl apply -f svc-tekever-challenge.yml
```

## Using Docker
```
docker run -d -p 5000:5000 --name tekever_challenge maarcoalr/tekever_challenge:latest
```
or
```
docker compose up -d
```

## Using VSCode for Windows 
```
py -3 -m venv .venv
.venv\scripts\activate
python -m pip install --upgrade pip
python -m pip install flask
python -m flask run
```