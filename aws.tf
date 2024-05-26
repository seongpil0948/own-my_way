
# # _를 기준으로 provider와 provider의 리소스를 구분
# # ex: aws_instance = provider: aws, resource: instance
# resource "aws_instance" "inst_sample_1" {
#   ami           = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"
# }

# resource "aws_instance" "inst_sample_2" {
#   ami           = "ami-0c55b159cbfafe1f0"
#   instance_type = aws_instance.inst_sample_1.instance_type
# }
# resource "aws_instance" "inst_sample_3" {
#   ami           = "ami-0c55b159cbfafe1f0"
#   depends_on    = [aws_instance.inst_sample_1]
#   instance_type = aws_instance.inst_sample_1.instance_type
# }

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones
# data "aws_availability_zones" "available" {
#   state = "available"
# }

# resource "aws_subnet" "primary" {
#   vpc_id            = aws_vpc.main.id
#   availability_zone = data.aws_availability_zones.available.names[0]
# }
# resource "aws_subnet" "secondary" {
#   vpc_id            = aws_vpc.main.id
#   availability_zone = data.aws_availability_zones.available.names[1]
# }
