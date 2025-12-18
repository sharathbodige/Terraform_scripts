


output "instance_public_ip" {

  value = module.my_ec2.Public-IP
}


output "instance_private_ip" {

  value = module.my_ec2.Private-IP
}


output "s3_info" {

  value = module.my_s3.bucket-info
}
