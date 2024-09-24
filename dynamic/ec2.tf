
resource "aws_instance" "dynamic" {
    ami="ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.terraform.id]
    tags={
        Name="allow"
    }

}
resource "aws_security_group" "terraform"{
    name="terraform"
    description = "it allow-port number 22 for ssh-access"
    dynamic ingress {
        for_each = var.ingress_rules
        content{
        from_port = ingress.value["from_port"]
        to_port = ingress.value["to_port"]
        protocol = ingress.value["protocol"]
        cidr_blocks = ingress.value["cidr_blocks"]
        ipv6_cidr_blocks=ingress.value["ipv6_cidr_blocks"]
        description =ingress.value["description"]
        }
    }
    /* ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    } */
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags={
        Name="terraform"
    }
}