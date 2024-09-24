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
     ingress{
        from_port=80
        to_port=80
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

resource "aws_instance" "allow"{
    ami="ami-09c813fb71547fc4f"
    instance_type="t3.micro"
    vpc_security_group_ids = [aws_security_group.sg-local.id]
    tags={
        Name="allow"
    }

# in this case my laptop is local
    provisioner "local-exec" {
        command="echo ${self.private_ip} > private_ip.txt"

    }
    connection{
        type="ssh"
        user="ec2-user"
        password="DevOps321"
        host=self.public_ip
    }
    provisioner "remote-exec" {
        inline = [    
            "sudo dnf install ansible -y",
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx",
        ]
  
    }
}
