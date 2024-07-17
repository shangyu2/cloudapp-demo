resource "tencentcloud_elasticsearch_instance" "foo" {
  instance_name       = "${var.app_name}-elasticsearch"
  availability_zone   = var.app_target.availability_zone
  version             = "7.14.2"
  vpc_id              = var.app_target.vpc.id
  subnet_id           = var.app_target.subnet.id
  password            = "Test12345"
  license_type        = "basic"
  charge_type         = var.charge_type == "PREPAID" ? "PREPAID" : "POSTPAID_BY_HOUR"
  charge_period       = var.charge_perpaid_period
  basic_security_type = 2

  web_node_type_info {
    node_num  = 1
    node_type = "ES.S1.MEDIUM4"
  }

  node_info_list {
    node_num  = 3
    node_type = "ES.S1.MEDIUM8"
    encrypt   = false
    disk_type = "CLOUD_SSD"
    disk_size = 80
  }
}
