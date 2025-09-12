resource "kind_cluster" "default" {
  name = var.name
  wait_for_ready = true
  node_image = "kindest/node:v1.34.0"

  kind_config {
    kind = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
      kubeadm_config_patches = var.kubeadm_config_patches

      extra_port_mappings {
        container_port = 80
        host_port      = 3000
        listen_address = "0.0.0.0"
        protocol       = "TCP"
      }

      extra_port_mappings {
        container_port = 443
        host_port      = 4000
        listen_address = "0.0.0.0"
        protocol       = "TCP"
      }
    }
    node { role = "worker" }
    node { role = "worker" }
    networking {
      api_server_address = var.api_server_address
      api_server_port    = var.api_server_port
    }
  }
}
