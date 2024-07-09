resource "tencentcloud_instance" "main" {
  instance_name     = "${var.app_name}_instance"
  region            = var.app_zone.region
  availability_zone = var.app_target.availability_zone
  image_id          = var.app_cvm.image_id
  instance_type     = var.app_cvm.instance_type
  password     = random_password.cvm.result

  vpc_id            = "${tencentcloud_vpc.main.id}"
  subnet_id         = "${tencentcloud_subnet.main.id}"

  instance_charge_type = "PREPAID"
  instance_charge_type_prepaid_period = 1
  cam_role_name     = var.cloudapp_cam_role

  count = 1
}
