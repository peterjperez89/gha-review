//launch temp
resource "aws_launch_template" "lt1" {
  image_id               = "ami-0cbe318e714fc9a82"
  instance_type          = "t2.micro"
  name                   = "myfirstlt"
  vpc_security_group_ids = [var.elbsgid]
 
  user_data = base64encode(
    <<-EOF
    #!/bin/bash
    sudo yum update
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "Hi I am $HOSTNAME" >> var/www/html/index.html
    EOF
  )
}
