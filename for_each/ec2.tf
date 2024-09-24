resource "aws_security_group" "terraform" {
    name="terraform"
    description = "it allow port number 22 for ssh access"
    ingress {
        from_port=22
        to_port=22
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
        ipv6_cidr_blocks=["::/0"]
    }
    egress {
     from_port = 0
     to_port = 0
     protocol="-1"
     cidr_blocks= [ "0.0.0.0/0" ]
    ipv6_cidr_blocks = ["::/0"]
    }
    tags={
        Name="Terraform"
    }
}

resource "aws_instance" "allow" {
    for_each=var.instances
    ami="ami-09c813fb71547fc4f"
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.terraform.id]
    tags={
        Name=each.key
    }

}