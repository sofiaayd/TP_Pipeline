variable "aws-region" {
  default  = "eu-west-1"
}

variable "vpc-cidr" {
    default = "10.0.0.0/16"
}

variable "subnets-cidr" {
    default = "10.0.1.0/24"
}


variable "aws-zone" {
	default = "eu-west-1a"
}

variable "webservers-ami" {
  default = "ami-0383535ce92966dfe"
}

variable "type-instance" {
  default = "t2.nano"
}

variable "security-group-ingress-rules" {
        default = [
        { 
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_block  = ["0.0.0.0/0"]
          description = "SSHOnly"
        },
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_block  = ["0.0.0.0/0"]
          description = "Cli"
        },
    ]
}

variable "stream-name" {
}

variable "create-api-gateway" {
  default = false
}

variable "s3-backup" {
  default = true
}

variable "shard-count" {
  default = "1"
}

variable "retention-period" {
  default = "48"
}

variable "application-name" {
}

output "url-invoke" {
  value = aws_api_gateway_deployment.mod[0].url-invoke
}

