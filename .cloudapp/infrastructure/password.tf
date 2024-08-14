# 这里定义用到的密码

resource "random_password" "password_for_db" {
  length           = 16
  override_special = "_+-&=!@#$%^*()"
}

output "password_for_db" {
  value = random_password.password_for_db.result
  description = "db 密码"
}

resource "random_password" "password_for_cvm" {
  length           = 16
  override_special = "_+-&=!@#$%^*()"
}

output "password_for_cvm" {
  value = random_password.password_for_cvm.result
  description = "cvm 密码"
}

resource "random_password" "password_for_redis" {
  length           = 16
  override_special = "_+-&=!@#$%^*()"
}

output "password_for_redis" {
  value = random_password.password_for_redis.result
  description = "redis 密码"
}

resource "random_password" "password_for_es" {
  length           = 16
  override_special = "_+-&=!@#$%^*()"
}

output "password_for_es" {
  value = random_password.password_for_es.result
  description = "es 密码"
}