resource "aws_instance" "expense"{
    count=length(var.tags_names)
    ami="ami-09c813fb71547fc4f"
    instance_type="t3.micro"
    vpc_security_group_ids = [aws_security_group.sg-terraform.id]
    tags={
        Name=var.tags_names[count.index]
    }
}
resource "aws_security_group" "sg-terraform" {
    name="teraform"
    description = "It allow port number 22 for ssh allow access"
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
        Name="terraform-sg"
    }
  
}