variable "instance_names"{
    type=list(string)
    default=["mysql", "frontend", "backend"]

}
variable "zone_id"{
    default="Z04729101AWEOYIE4LE28"
}