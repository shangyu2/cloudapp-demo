resource "tencentcloud_clb_instance" "internal_clb" {
  network_type = "INTERNAL"
  security_groups = [tencentcloud_security_group.sg.id]
  vpc_id       = tencentcloud_vpc.main.id
  subnet_id    = tencentcloud_subnet.main.id
}
