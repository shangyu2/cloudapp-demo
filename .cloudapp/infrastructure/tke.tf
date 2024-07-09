resource "tencentcloud_kubernetes_cluster" "tke-cluster1" {
  availability_zone   = var.app_target.availability_zone
  vpc_id              = tencentcloud_vpc.main.id
  subnet_ids          = [tencentcloud_subnet.main.id]
  cluster_cidr        = "10.247.0.0/16"
  cluster_os          = "tlinux3.1x86_64"
  cluster_os_type     = "GENERAL"
  cluster_deploy_type = "MANAGED_CLUSTER"
  network_type        = "GR"
  cluster_ipvs        = true
  container_runtime   = "containerd"
  cluster_max_service_num = 256
  cluster_level       = "L5"
  cluster_version     = "1.28.3"


  worker_config {
    count             = 2
    availability_zone = var.app_target.availability_zone
    region            = var.app_zone.region
    instance_type     = "S5.2XLARGE32"
    img_id            = "img-487zeit5"
    subnet_id         = tencentcloud_subnet.main.id
    cam_role_name     = var.cloudapp_cam_role
    system_disk_type           = "CLOUD_SSD"
    system_disk_size           = 200
    internet_charge_type       = "PREPAID"
    instance_charge_type_prepaid_period  = 1
  }
  worker_config {
    count             = 1
    availability_zone = var.app_target.availability_zone
    region            = var.app_zone.region
    instance_type     = "S5.4XLARGE64"
    img_id            = "img-487zeit5"
    subnet_id         = tencentcloud_subnet.main.id
    cam_role_name     = var.cloudapp_cam_role
    system_disk_type           = "CLOUD_SSD"
    system_disk_size           = 200
    internet_charge_type       = "PREPAID"
    instance_charge_type_prepaid_period  = 1
  }

  labels = {
    "test1" = "test1",
    "test2" = "test2",
  }
}
