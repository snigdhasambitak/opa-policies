resource "aws_instance" "my_web_instance" {
 instance_type = "t2.nano"
 ami = "ami-09b4b74c"
 tags = {
  "team" = "Digital",
  "service" = "tomcat",
  "env" = "Dev"
 }
}