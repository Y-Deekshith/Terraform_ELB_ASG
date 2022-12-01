resource "aws_autoscaling_group" "asg" {
    name = "${aws_launch_configuration.launchconfig.name}-asg"
    max_size = 4
    min_size = 2
    desired_capacity = 2
    health_check_type = "ELB"
    load_balancers = [ "${aws_elb.elasticlb.id}" ]

    launch_configuration = "${aws_launch_configuration.launchconfig.id}"
    
    enabled_metrics = ["GroupMinSize","GroupMaxSize","GroupDesiredCapacity","GroupInServiceInstances","GroupTotalInstances"]
    metrics_granularity = "1Minute"
    vpc_zone_identifier  = ["${aws_subnet.publicsubnet1.id}","${aws_subnet.publicsubnet2.id}"]

    lifecycle {
    create_before_destroy = true
    }
    tag {
    key                 = "Name"
    value               = "asg"
    propagate_at_launch = true
  }
}