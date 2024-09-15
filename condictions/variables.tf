variable "tags_names"{
    type=list(string)
    default=["backend", "mysql", "frontend"]
}
 variable "envitonment" {
    type=string
    default="prod"
   
 }
 variable "instance_type" {
    default="t3.medium"
   
 }