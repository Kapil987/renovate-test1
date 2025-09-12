variable "kubeconfig_path" {
  description = "Path to kubeconfig file"
  type        = string
}

# The path given in below will be w.r.t to .hcl file of this module
variable "k8s_yamls_dir" {
  description = "Directory containing Kubernetes YAML manifests"
  type        = string
  # default     = "infra/k8s-resources"
  default     = "./"
}

variable "yaml_file" {
  type        = string
  description = "Path to the single Kubernetes YAML manifest"
  default = "nginx_deployment.yaml"
}

# variable "yaml_files" {
#   description = "List of Kubernetes YAML files to apply"
#   type        = list(string)
# }
