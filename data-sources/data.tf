# Find the latest available AMI that is tagged with Component = web
data "aws_ami" "web" {
   most_recent = true
   owners=["973714476881"]
  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
 
}
