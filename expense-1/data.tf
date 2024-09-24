data "aws_ami" "www"{
   most_recent = true
   owners=["973714476881"]
   filter {
    name   = "name"
    values = ["RHEL-9-Devops-Practice"]
  }
}
