provider "aws" {
  region = "us-east-1"
  access_key="A389438addffiosdios22"
  secret_key="9384398493849hhj908848484884444"
}
   
resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-key"
  public_key = file("terraform-key.pub")
}

resource "aws_security_group" "allow_web_ssh" {
  name        = "allow_web_ssh"
  description = "Allow HTTP and SSH access"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "docker_ec2" {
  ami                    = "ami-0e35ddab05955cf57" # Ubuntu Server 22.04 LTS (us-east-1)
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.terraform_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_web_ssh.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ubuntu
              docker run -d -p 80:80 nginx
              EOF

  tags = {
    Name = "Ubuntu-Docker-EC2"
  }
}

output "public_ip" {
  value = aws_instance.docker_ec2.public_ip
}
