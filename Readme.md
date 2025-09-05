```json
{
  "enabledManagers": ["dockerfile", "helm-values", "kubernetes"],
  "dockerfile": {
    "managerFilePatterns": [
      "/(^|/|\\.)([Dd]ocker|[Cc]ontainer)file$/",
      "/(^|/)([Dd]ocker|[Cc]ontainer)file[^/]*$/",
      "/app/([Dd]ocker|[Cc]ontainer)file$",
      "/app/([Dd]ocker|[Cc]ontainer)file[^/]*$"
    ]
  },
  "kubernetes": {
    "managerFilePatterns": ["/k8s/envs/.+\\.ya?ml$/"]
  }
}

```