# 1.command line
# 2. terraform.tfvars
# 3.environment variables export TF_VAR_instance_type=t3.large
# 4. default
# 5.prompt


variable "ami_id"{
    type=string
    default="ami-09c813fb71547fc4f"
}
variable "instance_type" {
    type=string
    # default="t3.micro"

}
variable "tag_names"{
    type=map(string)
    default={
        Name="variables-terraform"
        project="expense"
        environment="dev"
        modules="backend"
        terraform="yes"
    }
}
variable "sg_name" {
    type=string
    default="rg-terraform"
}
variable "sg_description" {
    type=string
    default="this allow port number 22 ssh access"
  
}
variable "from_port" {
    type=number
    default=22
  
}
variable "to_port"{
    type=number
    default = 22
}
variable "protocol"{
    type=string
    default="tcp"
}
variable "cidr_blockls"{
    type=list(string)
    default=["0.0.0.0/0"]
}
variable "ipv6_cidr_blocks"{
    type=list(string)
    default=["::/0"]
}