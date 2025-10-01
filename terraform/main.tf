resource "aws_key_pair" "terraKey" {
  key_name   = "terraKey"
  public_key = file("/home/ubuntu/.ssh/id_ed25519.pub")
}

resource "aws_default_vpc" "myVpc" {
  tags = {
    Name = "myVpc"
  }
}

resource "aws_security_group" "mySg" {
  name        = "FlaskMysqlSg"
  description = "This will be used for Flask-Mysql-App"
  vpc_id      = aws_default_vpc.myVpc.id

  tags = {
    Name = "mySg"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 31004
    to_port     = 31004
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
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

resource "aws_instance" "terraInstance" {
  key_name               = aws_key_pair.terraKey.key_name
  vpc_security_group_ids = [aws_security_group.mySg.id]
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_type

  # Root volume (8 GB)
  root_block_device {
    volume_size = var.ec2_block_storage
    volume_type = "gp3"
  }

  tags = {
    Name = "TestEc2"
  }
}

