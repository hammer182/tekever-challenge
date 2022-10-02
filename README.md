# Tekever Challenge

[API](http://challenge.tekever.maarcoalr.co:5000)

## About this project:

This project was developed locally using Vagrant to provision a virtual machine with all the necessary dependencies. This simple API was developed in Python Flask and initial tests were carried out locally. After validating this API I made the Dockerfile to run it as a container. Using Docker Desktop I created a Kubernetes cluster for the next stage of development. Used manifests: deployment, service, and statefulset. For the Jenkins initial setup: created a user  and installed the necessary plugins. In this project, I used Docker Pipeline and Kubernetes Continuous Deployment, then configured DockerHub and Kubeconfig file credentials.  
Every time a commit to the GitHub repository is made, the pipeline is triggered. It fetches the code, build the image, uploads to DockerHub and deploys it to the Kubernetes cluster.    
After local tests were completed successfully, I started the cloud-based processes using the AWS Cloud platform.    
I manually created an IAM User, S3 bucket and hosted zone. The EC2 instance, security group, the locally generated key pair, VPC, Subnet, and Gateway were all provisioned using Terraform. Jenkins, Kubectl, Kops, Docker, and the AWS CLI were all installed as part of the provisioning process using bash scripting. In the instance created, I generated the key to be used by all instances of the cluster. Configured the AWS CLI, then created, updated, and validated the cluster. The tests previously performed locally were performed in the cloud and the result of the CI/CD pipeline was pretty satisfactory.  

## Flowchart

![Flowchart](https://i.imgur.com/OKXxTdm.png)

## Using the API
This is a pretty simple API, developed using Python Flask. 
Access [directly](http://challenge.tekever.maarcoalr.co:5000) or using [/user/?user=SOMEARGUMENT (ex: /user/?user=maarcoalr)](http://challenge.tekever.maarcoalr.co:5000/user/?user=tekever)

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

# Resources, approach and difficulties
## 1. 
When I turned on my computer after getting the email with the challenge, I saw an automatic Windows update. I start the project but several unusual errors were occurring, GitBash was not working properly and it was not possible to run virtual machines using Vagrant. Some Youtube videos helped me to restore normality.

## 2. 
The official documentation for Docker, Kubernetes, Terraform, Jenkins and AWS are great resouces.

## 3. 
I was unable to run the cluster application over HTTPS, but I am researching how to do so in future projects.

## 4. 
Jenkins no longer offers the Kubernetes Continuous Deployment plugin.
I was able to use it after finding it online, but later on I learned that it had been suspended because of unresolved security issues. I'm looking for safer alternatives looking forward future implementations. 