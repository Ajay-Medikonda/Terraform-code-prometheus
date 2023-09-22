#Creating Route53 hosted Zone
resource "aws_route53_zone" "primary" {
  name = "ajay.com"
}

#Creating Records
resource "aws_route53_record" "prom" {
  zone_id = aws_route53_zone.primary.zone_id #route53 zone id created.
  name    = "prom"  #prom is added to ajay.com > prom.ajay.com
  type    = "A"
  ttl     = 300
  records = [aws_instance.web-1.public_ip] #Assigining DNS in line '9' to purticular instance using public ip.

}

import {
  to = aws_service_discovery_private_dns_namespace.example
  #id = "Namespace_id : Vpc_id"
  id = "aws_route53_zone.primary.zone_id:aws_vpc.default.id"
}