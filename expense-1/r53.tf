resource "aws_route53_record" "www" {
  count=length(var.instance_names)
  zone_id = var.zone_id
  #backend.asividevops.online
  name    = "${var.instance_names[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = var.instance_names[count.index]=="frontend"?[aws_instance.allow[count.index].public_ip]:[
    aws_instance.allow[count.index].private_ip]
    allow_overwrite = true
}