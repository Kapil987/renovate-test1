# main.tf
# Create kind cluster
resource "kind_cluster" "default" {
  name           = "demo"
  wait_for_ready = true
  kind_config {
    kind        = "Cluster"
    api_version = "kind.x-k8s.io/v1alpha4"

    node {
      role = "control-plane"
      kubeadm_config_patches = [
        <<EOF
apiVersion: kubeadm.k8s.io/v1beta3
kind: ClusterConfiguration
apiServer:
  certSANs:
  - "127.0.0.1"
  - "localhost"
  - "0.0.0.0"
  - "172.31.44.150"
EOF
      ]
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
      api_server_address = "0.0.0.0"
      api_server_port    = 6443
    }
  }
}

resource "null_resource" "get_kind_subnet_range" {
  provisioner "local-exec" {
    command = <<EOT
      SUBNET=$(docker inspect --type network kind | jq -r '.[0].IPAM.Config[0].Subnet')
      echo $SUBNET
    EOT
    interpreter = ["/bin/bash", "-c"]
  }
}

resource "helm_release" "metallb" {
  depends_on = [kind_cluster.default]

  name             = "metallb"
  repository       = "https://metallb.github.io/metallb"
  chart            = "metallb"
  namespace        = "metallb"
  create_namespace = true
  version          = "0.15.2"

  values = [
    <<EOF
config:
  address-pools:
  - name: default
    protocol: layer2
    addresses:
    - 172.18.0.0/16 - 172.18.0.10/16
EOF
  ]
}


resource "kubernetes_manifest" "nginx" {
  manifest = yamldecode(file("${path.module}/nginx_deployment.yaml"))
}