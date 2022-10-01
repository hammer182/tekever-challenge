# tekever_challenge

API [link](http://challenge.tekever.maarcoalr.co:5000)

## About this project:

Esse projeto foi desenvolvido localmente utilizando o Vagrant para provisionar uma máquina virtual com todas as dependências necessárias. Esta simples API foi desenvolvida em linguagem python flask e os testes iniciais foram realizados localmente. Após a validação dessa API fiz o Dockerfile para execução da mesma no container.
Utilizando o Docker Desktop criei um Kubernetes cluster para a próxima etapa do desenvolvimento. Desenvolvi o deployment, service e statefulset a serem utilizados pelo kuberentes. Em seguida, localmente, criei a pipeline no Jenkins para puxar as atualizações do repositório do GitHub. Essa pipeline é executada toda vez que o repositório do GitHub é atualizado, verifica as dependências, builda a imagem, sobe ela pro DockerHub e realiza o deploy para o cluster. Testes locais executados com sucesso, iniciei os procedimentos na nuvem, usando a plataforma de cloud AWS. 
Criei um S3 bucket, hosted zone e IAM User. O Terraform foi a ferramente utilizada para provisionar a instância EC2, o grupo de segurança, o par de chaves - gerado localmente - o VPC, Subnet e Gateway. O provisionamento, com bash scripting, também fez a instalação das dependências necessárias, Jenkins, Kubectl, Kops, Docker e AWS CLI. Na instância criada gerei a chave a ser usada por todas instâncias do cluster. Configuração do AWS CLI e em seguida criação, atualização e validação do cluster. Configuração inicial do Jenkins, criação do usuário e instalação dos plugins necessários. Nesse projeto utilizei Docker Pipeline e Kubernetes Continuous Deployment. Criação das credenciais do DockerHub e Kubeconfigfile no Jenkins.
