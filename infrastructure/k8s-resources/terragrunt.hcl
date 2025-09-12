terraform {
  source = "../modules/k8s-resources"
}

dependency "kind" {
  config_path = "../kind/terragrunt.hcl"
  mock_outputs = {
    kubeconfig_path  = "~/.kube/config"
  }
}

# The `inputs` block passes variable values to the Terraform module.
inputs = {
  # kubeconfig_path = "~/.kube/config"
  kubeconfig_path   = dependency.kind.outputs.kubeconfig_path
  # yaml_files        = fileset(path_relative_from_include(),"*.yaml")
  # yaml_file       = "nginx_deployment.yaml"
}


dependencies {
  paths = ["../helm"]
}


## From parent module or root.hcl
include "root"{
  path = find_in_parent_folders("root.hcl")
  expose = true
}

exclude {
    # if = true # Exclude only for development environments.
    if = include.root.locals.skip_k8s       # Exclude only for development environments.
    actions = ["all"]                       # Exclude all actions.
    # exclude_dependencies = true           # Exclude dependencies along with the unit.
}