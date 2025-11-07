module "linode" {
  source       = "./linode"
  linode_token = var.linode_token
  linode_label = "cluster"
  linode_tags  = ["prod"]
}

module "k8s" {
  source     = "./k8s"
  cluster    = module.linode.cluster
  sleep      = module.linode.grace_period
  kubeconfig = module.linode.kubeconfig
}
