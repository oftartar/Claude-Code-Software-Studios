# infra/

Infrastructure as code. Owned by `platform-lead` (strategy) and
`devops-engineer` (implementation). Rules: `.claude/rules/infra-code.md`.

```
ci/       Pipeline definitions (mirror of / source for .github/workflows/)
iac/      Terraform / Pulumi / CDK — plan-review before apply
docker/   Dockerfiles, compose files
```

Pinned versions, least privilege, no plaintext secrets, reproducible builds.
