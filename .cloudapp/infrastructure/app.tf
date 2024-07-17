resource "cloudapp_helm_app" "app" {
  cluster_id     = tencentcloud_kubernetes_cluster.tke-cluster1.id
  chart_src      = "../software/chart"
  chart_username = var.cloudapp_repo_username
  chart_password = var.cloudapp_repo_password

  chart_values = {
    cloudappImageCredentials = {
      registry = var.cloudapp_repo_server
      username = var.cloudapp_repo_username
      password = var.cloudapp_repo_password
    }

    nacos = {
      mysql = {
        host = tencentcloud_mysql_instance.mysql.intranet_ip
        port  = tencentcloud_mysql_instance.mysql.intranet_port
        password = tencentcloud_mysql_instance.mysql.root_password
      }
    }
  }
}
