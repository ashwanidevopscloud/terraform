resource "aws_security_group" "sg-local"{
    name="allow"
    description="it allow port number 22"
    ingress{
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
        ipv6_cidr_blocks=["::/0"]
    }
    egress{
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

resource "aws_instance" "allow-every"{
    count=length(var.instance_names)
    ami=data.aws_ami.web.id
    instance_type=var.instance_names=="mysql"? "t3.small":"t3.micro"
    vpc_security_group_ids=[aws_security_group.sg_local.id]
    tags={
        Name=var.instance_names[count.index]
    }
}