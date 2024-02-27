resource "aws_security_group" "ALB" {
  name = "ALB security group"
  description = "To be used by ALB in the project"
  vpc_id = aws_vpc.EKS_VPC.id

  ingress {
    protocol = "tcp"
    from_port = "80"
    to_port = "80"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "EKS" {
  name = "EKS Nodes SG"
  description = "To be used by EKS in project"
  vpc_id = aws_vpc.EKS_VPC.id

  ingress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "bastion" {
  name = "Bastion SG"
  description = "To be used by bastion host in this project"
  vpc_id = aws_vpc.EKS_VPC.id

  ingress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol = "-1"
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}