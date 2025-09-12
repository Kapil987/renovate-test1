variable "kubeconfig_path" {
  type = string
}

variable "metallb_version" {
  type    = string
  default = "0.15.2"
}

# get the address-pools from the docker inspect command , docker inspect --type network kind | jq -r '.[0].IPAM.Config[0].Subnet'
variable "metallb_config" {
  type    = string
  default = <<EOF
config:
  address-pools:
  - name: default
    protocol: layer2
    addresses:
    - 172.18.0.0/16 - 172.18.0.10/16
EOF
}
