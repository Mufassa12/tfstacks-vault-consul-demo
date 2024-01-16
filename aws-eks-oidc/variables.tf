variable "tfc_kubernetes_audience" {
  type    = string
}

variable "tfc_hostname" {
  type    = string
  default = "https://app.terraform.io"
}

variable "tfc_group_claims" {
  type    = string
  default = "hashi-demos-apj"
}

variable "cluster_name" {
  type    = string
}

