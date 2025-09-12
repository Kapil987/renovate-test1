terraform {
  source = "../modules/helm"
}

dependency "kind" {
  config_path = "../kind/terragrunt.hcl"
  mock_outputs = {
    kubeconfig_path  = "mock-kubeconfig_path-output"
  }
}

inputs = {
  kubeconfig_path = dependency.kind.outputs.kubeconfig_path
  # kubeconfig_path = "~/.kube/config"
  metallb_version = "0.15.2"
}
