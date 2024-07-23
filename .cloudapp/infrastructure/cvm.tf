resource "tencentcloud_instance" "main" {
  instance_name                       = "${var.app_name}_instance"
  availability_zone                   = var.app_target.availability_zone
  image_id                            = var.app_cvm_image.image_id #"img-mmytdhbn"
  instance_type                       = var.app_cvm.instance_type
  password                            = random_password.cvm.result
  vpc_id                              = var.app_target.vpc.id
  subnet_id                           = var.app_target.subnet.id
  instance_charge_type                = var.charge_type == "PREPAID" ? "PREPAID" : "POSTPAID_BY_HOUR"
  instance_charge_type_prepaid_period = var.charge_perpaid_period
  cam_role_name                       = var.cloudapp_cam_role
}
