output "publicip" {
value = aws_instance.app_server.public_ip
}

output "privateip" {

value = aws_instance.app_server.private_ip
}
