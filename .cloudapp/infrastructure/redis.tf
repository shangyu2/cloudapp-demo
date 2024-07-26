resource "tencentcloud_redis_instance" "redis" {
  vpc_id             = var.network_source == "exist" ? var.app_network_vpc.vpc.id : tencentcloud_vpc.main.id
  subnet_id          = var.network_source == "exist" ? var.app_network_vpc.subnet.id : tencentcloud_subnet.main.id
  availability_zone  = var.network_source == "exist" ? var.app_network_vpc.availability_zone : var.app_zone.zone
  type_id            = 8
  password           = random_password.password_for_redis.result
  charge_type        = var.charge_type == "PREPAID" ? "PREPAID" : "POSTPAID"
  prepaid_period     = var.charge_perpaid_period
  mem_size           = 8192
  redis_shard_num    = 1
  redis_replicas_num = 1
  name               = "${var.app_name}-redis"
  port               = 6379
}
