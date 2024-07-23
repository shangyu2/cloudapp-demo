resource "tencentcloud_clb_instance" "internal_clb" {
  network_type    = "INTERNAL"
  security_groups = [var.app_sg.security_group_id]
  vpc_id          = var.app_target.vpc.id
  subnet_id       = var.app_target.subnet.id
}
