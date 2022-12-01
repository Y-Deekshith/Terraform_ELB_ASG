resource "aws_launch_configuration" "launchconfig" {
  name_prefix   = "terraform"
  image_id      = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  key_name = "NVirginiaPC"

    security_groups = [ "${aws_security_group.terraform_sg.id}" ]
    associate_public_ip_address = true
    user_data = "${file("data.sh")}"
  lifecycle {
    create_before_destroy = true
  }
}