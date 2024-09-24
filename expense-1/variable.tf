variable "instance_names"{
    type=list(string)
    default=["frontend", "backend","mysql"]
}
variable "zone_id"{
    default="Z04729101AWEOYIE4LE28"
}
variable "domain_name"{
    default="asividevops.online"
}