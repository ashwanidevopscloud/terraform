variable "tags_names"{
    type=list(string)
    default=["backend", "mysql", "frontend"]
}
variable "common-tags" {
    type=map(string)
    default={
        environment="dev"
        project="expense"
        terraform= "yes"
    }
  
}