resource "tencentcloud_instance" "main" {
  instance_name                       = "${var.app_name}_instance"
  availability_zone                   = var.network_source == "exist" ? var.app_network_vpc.availability_zone : var.app_zone.zone
  image_id                            = var.app_cvm_image.image_id #"img-mmytdhbn"
  instance_type                       = var.app_cvm.instance_type
  password                            = random_password.password_for_cvm.result
  vpc_id                              = var.network_source == "exist" ? var.app_network_vpc.vpc.id : tencentcloud_vpc.main.id
  subnet_id                           = var.network_source == "exist" ? var.app_network_vpc.subnet.id : tencentcloud_subnet.main.id
  instance_charge_type                = var.charge_type == "PREPAID" ? "PREPAID" : "POSTPAID_BY_HOUR"
  instance_charge_type_prepaid_period = var.charge_perpaid_period
  cam_role_name                       = var.cloudapp_cam_role
}
