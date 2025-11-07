
output "kubeconfig" {
  depends_on = [linode_lke_cluster.cluster]
  value      = yamldecode(base64decode(linode_lke_cluster.cluster.kubeconfig))
  sensitive  = true
}

output "grace_period" {
  value = time_sleep.linode_grace_period
}

output "cluster" {
  value = linode_lke_cluster.cluster
}
