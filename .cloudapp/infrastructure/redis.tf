resource "tencentcloud_redis_instance" "redis" {
  vpc_id            = tencentcloud_vpc.main.id
  subnet_id         = tencentcloud_subnet.main.id 
  availability_zone = var.app_target.availability_zone
  type_id            = 8
  password           = random_password.redis.result
  mem_size           = 8192
  redis_replicas_num = 1
  name               = "${var.app_name}-redis"
  port               = 6379
  charge_type        = "PREPAID"
  prepaid_period     = 1
}
