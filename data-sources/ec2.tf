resource "aws_instance" "data-source"{
ami=data.aws_ami.web.id
instance_type="t3.micro"
vpc_security_group_ids = [aws_security_group.sg_allow.id]
tags={
    Name="frontend"
}
}


resource "aws_security_group" "sg_allow"{
    name="allow"
    description = "this allow port number 22"
    egress{
        from_port = 0
        to_port=0
        protocol="-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol="tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags={
        Name="allow-terraform"
    }

}