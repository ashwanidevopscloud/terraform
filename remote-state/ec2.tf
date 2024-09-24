
resource "aws_instance" "allow"{
    ami="ami-09c813fb71547fc4f"
    instance_type="t3.micro"
    vpc_security_group_ids = [aws_security_group.terraform.id]
    tags={
        Name="allow"
    }
}

resource "aws_security_group" "terraform" {
    name="terraform"
    description="It allow port number 22 for ssh access"
    ingress {
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
        ipv6_cidr_blocks=["::/0"]
    }
    egress { 
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
        ipv6_cidr_blocks=["::/0"]
    }
    tags={
        Name="terraform"
    }
  
}

