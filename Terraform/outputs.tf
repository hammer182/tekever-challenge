output "ips" {  
  value = aws_instance.tekever[*].public_ip
}