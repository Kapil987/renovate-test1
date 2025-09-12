variable "name" {
  type    = string
  default = "demo"
}

variable "kubeadm_config_patches" {
  type    = list(string)
  default = [
    <<-EOF
apiVersion: kubeadm.k8s.io/v1beta3
kind: ClusterConfiguration
apiServer:
  certSANs:
  - "127.0.0.1"
  - "localhost"
  - "0.0.0.0"
EOF
  ]
}

variable "api_server_address" {
  type    = string
  default = "0.0.0.0"
}

variable "api_server_port" {
  type    = number
  default = 6443
}
