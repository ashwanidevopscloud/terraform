variable "instances"{
    type=map
    default={
        mysql="t3.small"
        backend="t3.micro"
        frontend="t3.micro"
    }
}
variable "zone_id" {
    default="Z04729101AWEOYIE4LE28"
  
}
variable "domain_name"{
    default="asividevops.online"
}