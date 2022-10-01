resource "aws_key_pair" "tekever-aws" {
  key_name   = "tekever_keypair"
  public_key = file(var.PUB_KEY)
}

resource "aws_instance" "tekever" {
  count                  = 1
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.TYPE
  subnet_id              = aws_subnet.tekever-pub-1.id
  key_name               = aws_key_pair.tekever-aws.key_name
  vpc_security_group_ids = ["${aws_security_group.tekever-SG.id}"]
  tags = {
    Name = "Tekever"
  }
  user_data = <<EOF
#!/bin/bash
apt-get update && apt install awscli -y && \
apt install openjdk-11-jre -y && \
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
curl -LO https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64 && \
chmod +x kops-linux-amd64 && \
sudo mv kops-linux-amd64 /usr/local/bin/kops && \
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null && \
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null && \
apt-get update && \
apt-get install jenkins -y
EOF
}