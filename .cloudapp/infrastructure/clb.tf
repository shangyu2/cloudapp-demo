resource "tencentcloud_clb_instance" "internal_clb" {
  network_type    = "INTERNAL"
  security_groups = [var.network_source == "exist" ? var.app_sg.security_group_id : tencentcloud_security_group.sg.id]
  vpc_id          = var.network_source == "exist" ? var.app_network_vpc.vpc.id : tencentcloud_vpc.main.id
  subnet_id       = var.network_source == "exist" ? var.app_network_vpc.subnet.id : tencentcloud_subnet.main.id
}
