# tekever_challenge

API [link](http://challenge.tekever.maarcoalr.co:5000)

## About this project:

This project was developed locally using Vagrant to provision a virtual machine with all the necessary dependencies. This simple API was developed in python flask language and initial tests were carried out locally. After validating this API I made the Dockerfile to run it in the container.
Using Docker Desktop I created a Kubernetes cluster for the next stage of development. I developed the deployment, service and statefulset to be used by Kuberentes. Then locally I created the pipeline in Jenkins to pull updates from the GitHub repository. This pipeline runs every time the GitHub repository is updated, checks for dependencies, builds the image, uploads it to DockerHub and deploys it to the cluster. Local tests successfully executed, I started the procedures in the cloud, using the AWS cloud platform.
I created an S3 bucket, hosted zone and IAM User. Terraform was the tool used to provision the EC2 instance, the security group, the key pair - generated locally - the VPC, Subnet and Gateway. Provisioning, with bash scripting, also installed the necessary dependencies, Jenkins, Kubectl, Kops, Docker and AWS CLI. In the instance created, I generated the key to be used by all instances of the cluster. Configuring the AWS CLI, then creating, updating, and validating the cluster. Initial Jenkins setup, user creation and installation of necessary plugins. In this project I used Docker Pipeline and Kubernetes Continuous Deployment. Creating DockerHub and Kubeconfigfile credentials in Jenkins.

## Flowchart

![Flowchart](https://i.imgur.com/OKXxTdm.png)

## Using the API
```
This API is pretty simple, you can simple access it or access using /user/?user=
```