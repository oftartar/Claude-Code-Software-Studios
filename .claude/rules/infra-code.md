---
paths:
  - "infra/**"
  - ".github/workflows/**"
  - "Dockerfile"
  - "Dockerfile.*"
  - "docker-compose*.yml"
  - "**/*.tf"
---

# Infrastructure Code Rules

- Pin versions: base images by digest or exact tag (never `latest`), actions by
  full SHA or major tag, Terraform providers with `~>` constraints and a lock
  file.
- Least privilege: CI tokens, cloud roles, and DB users get only the permissions
  the job needs. No wildcard IAM. No long-lived cloud keys where OIDC works.
- No plaintext secrets in workflow files, Dockerfiles, or tfvars. Reference the
  secret store.
- Builds are reproducible: lockfile-based installs (`npm ci`, `pip install -r`
  with hashes, `go mod verify`), no network-dependent build steps that can drift.
- Containers run as a non-root user, with a read-only root filesystem where
  feasible, and a defined `HEALTHCHECK`.
- Every pipeline runs, at minimum: install → typecheck/lint → unit tests →
  build. Deploy jobs are gated on all of them passing.
- Infrastructure changes are `plan`-reviewed before `apply`; `apply` on the main
  environment is manual or protected.
- Environments (dev/staging/prod) differ only by variables, not by divergent
  code paths.

## Examples

**Correct**

```dockerfile
FROM node:20.17.0-bookworm-slim@sha256:<digest>
USER node
HEALTHCHECK CMD node healthcheck.js
```

**Incorrect**

```dockerfile
FROM node:latest                       # VIOLATION: unpinned
ENV DATABASE_URL=postgres://u:pw@...    # VIOLATION: plaintext secret
RUN npm install                        # VIOLATION: non-deterministic (use npm ci)
```
