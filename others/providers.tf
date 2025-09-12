# providers.tf
terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
       version = "0.9.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "3.0.2"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.38.0"
    }
  }
}

provider "kind" {}

provider "kubernetes" {
  # Configure with kubeconfig path or context to access kind cluster created below
  config_path = "~/.kube/config"
  # config_path = kind_cluster.default.kubeconfig_path
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
    # config_path = kind_cluster.default.kubeconfig_path
  }
}


# provider "kubernetes" {
#   host                   = kind_cluster.default.endpoint
#   client_certificate     = kind_cluster.default.client_certificate
#   client_key             = kind_cluster.default.client_key
#   cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
  
# }

# provider "helm" {
#   kubernetes = {
#     host                   = kind_cluster.default.endpoint
#     client_certificate     = kind_cluster.default.client_certificate
#     client_key             = kind_cluster.default.client_key
#     cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
#   }
# }
