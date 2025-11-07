
resource "linode_lke_cluster" "cluster" {
  label       = var.linode_label
  k8s_version = var.linode_k8s_version
  region      = var.linode_region
  tags        = var.linode_tags

  pool {
    type  = "g6-standard-1"
    count = 3
  }
}

resource "time_sleep" "linode_grace_period" {
  depends_on = [linode_lke_cluster.cluster]

  create_duration = "15s"
}
