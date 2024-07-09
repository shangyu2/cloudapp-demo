resource "tencentcloud_elasticsearch_instance" "foo" {
  instance_name     = "${var.app_name}-elasticsearch"
  availability_zone = var.app_target.availability_zone
  version           = "7.14.2"
  vpc_id            = tencentcloud_vpc.main.id
  subnet_id         = tencentcloud_subnet.main.id
  password          = "Test12345"
  license_type      = "basic"
  charge_period     = 1
  charge_type       = "PREPAID"
  basic_security_type = 2

  web_node_type_info {
    node_num = 1
    node_type = "ES.S1.MEDIUM4"
  }

  node_info_list {
    node_num  = 3
    node_type = "ES.S1.MEDIUM8"
    encrypt = false
    disk_type = "CLOUD_SSD"
    disk_size = 80
  }
}
