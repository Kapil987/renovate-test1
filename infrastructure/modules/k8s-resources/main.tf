locals {
  yaml_files = fileset(var.k8s_yamls_dir, "*.yaml")
}


# If var.k8s_yamls_dir = /manifests and the directory contains:
# 
# deployment.yaml
# service.yaml
# The resource will create two instances:

# One with each.value = "deployment.yaml", manifest loaded from /manifests/deployment.yaml

resource "kubernetes_manifest" "resources" {
  for_each = { for f in local.yaml_files : f => f }

  manifest = yamldecode(file("${var.k8s_yamls_dir}/${each.value}"))
}

# resource "kubernetes_manifest" "resource" {
#   manifest = yamldecode(file(var.yaml_file))
# }

# resource "kubectl_manifest" "yamls" {
#   for_each  = toset(var.yaml_files)
#   yaml_body = file(each.value)
# }
