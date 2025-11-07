provider "kubernetes" {
  host                   = var.kubeconfig.clusters.0.cluster.server
  cluster_ca_certificate = base64decode(var.kubeconfig.clusters.0.cluster.certificate-authority-data)

  token = var.kubeconfig.users.0.user.token
}
