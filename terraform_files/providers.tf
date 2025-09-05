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
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}
