variable "REGION" {
  default = "eu-west-2"
}

variable "ZONE1" {
  default = "eu-west-2a"
}

variable "ZONE2" {
  default = "eu-west-2b"
}

variable "ZONE3" {
  default = "eu-west-2c"
}

variable "TYPE" {
  default = "t2.micro"
}

variable "AMIS" {
  type = map(any)
  default = {
    eu-west-2 = "ami-04842bc62789b682e"
  }
}

variable "PUB_KEY" {
  default = "tekever-challenge.pub"
}

variable "PRIV_KEY" {
  default = "tekever-challenge"
}

variable "MY_IP" {
  default = "2.83.233.137/32"
}
