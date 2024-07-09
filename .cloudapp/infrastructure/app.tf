resource "cloudapp_helm_app" "app" {
  cluster_id     = tencentcloud_kubernetes_cluster.tke-cluster1.id
  chart_src      = "../software/chart"
  chart_username = var.cloudapp_repo_username
  chart_password = var.cloudapp_repo_password
}
