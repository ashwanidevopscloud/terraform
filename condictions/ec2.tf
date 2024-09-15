resource "aws_instance" "count"{
    count=length(var.tags_names)
    ami="ami-09c813fb71547fc4f"
    instance_type=var.envitonment=="prod"? "t3.large":var.instance_type
    tags={
        Name=var.tags_names[count.index]
    }
}
resource "aws_security_group" "sg-terraform"{
    name="terraform"
    description = "this allow port number 22 for ssh access"
    ingress{
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags={
        Name="allow-count"
    }
}