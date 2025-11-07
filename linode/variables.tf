variable "linode_token" {
  type      = string
  sensitive = true
}

variable "linode_label" {
  type = string
}

variable "linode_tags" {
  type = list(string)
}

variable "linode_region" {
  type    = string
  default = "us-mia"
}

variable "linode_k8s_version" {
  type    = string
  default = "1.34"
}
