resource "aws_elb" "elasticlb" {
    name = "classiclb"
    security_groups = ["${aws_security_group.terraform_sg.id}"]
    subnets = [ "${aws_subnet.publicsubnet1.id}","${aws_subnet.publicsubnet2.id}" ]
    
    cross_zone_load_balancing = true

    health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
    }
    listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
    }
}

output "elbdns_output" {
  value = aws_elb.elasticlb.dns_name
}