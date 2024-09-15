resource "aws_instance" "count"{
    ami=var.ami_id
    instance_type=var.instance_type
    vpc_security_group_ids = [aws_security_group.sg-terraform.id]
    tags=var.tag_names
}
resource "aws_security_group" "sg-terraform"{
    name=var.sg_name
    description = var.sg_description
    ingress{
        from_port=var.from_port
        to_port=var.to_port
        protocol=var.protocol
        cidr_blocks = var.cidr_blockls
        ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }
    egress{
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks = var.cidr_blockls
        ipv6_cidr_blocks = var.ipv6_cidr_blocks
    }
    tags=var.tag_names
}