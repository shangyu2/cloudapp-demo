resource "tencentcloud_redis_instance" "redis" {
  vpc_id             = var.app_target.vpc.id
  subnet_id          = var.app_target.subnet.id
  availability_zone  = var.app_target.availability_zone
  type_id            = 8
  password           = random_password.redis.result
  charge_type        = var.charge_type == "PREPAID" ? "PREPAID" : "POSTPAID"
  prepaid_period     = var.charge_perpaid_period
  mem_size           = 8192
  redis_shard_num    = 3
  redis_replicas_num = 1
  name               = "${var.app_name}-redis"
  port               = 6379
}
