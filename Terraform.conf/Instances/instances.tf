resource "aws_instance" "webservers" {
	count = length(var.subnets-cidr) 
	ami = "(var.webservers-ami)"
	type-instance = var.type-instance
	security-groups = ["${aws_security_group.main-ingress.id}"]
    subnet-id = aws_subnet.main.id
}