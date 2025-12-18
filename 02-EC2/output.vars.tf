

output "Public-IP" {
  #value=aws_instance is resource_name and test2 is alias of the resource
  value = aws_instance.test2.public_ip
}

output "Private-IP" {
  #value=aws_instance is resource_name and test2 is alias of the resource
  value = aws_instance.test2.private_ip
}