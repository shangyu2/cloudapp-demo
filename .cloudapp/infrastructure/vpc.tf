resource "tencentcloud_vpc" "main" {
  name       = "${var.app_name}_vpc"
  availability_zone = var.app_target.availability_zone
  cidr_block = var.vpc_cidr_block
  dns_servers  = ["183.60.82.98", "183.60.83.19"]
  is_multicast = "false"
}
resource "tencentcloud_subnet" "main" {
  name              = "${var.app_name}_subnet"
  availability_zone = var.app_target.availability_zone
  cidr_block = var.subnet_cidr_block
  is_multicast      = "false"
  vpc_id            = tencentcloud_vpc.main.id
}
