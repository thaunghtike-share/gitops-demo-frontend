# GitOps Demo Frontend

An independent static frontend for Docker, Kubernetes, Helm, and ArgoCD labs.
It has no backend URL, API integration, database, authentication, or external
dependency.

The `main` branch displays `Production`. Change that text to `Development` or
`UAT` in the corresponding branches when demonstrating environment promotion.

## Run locally

```sh
docker build -t gitops-demo-fe .
docker run -d --name gitops-demo-fe -p 8080:80 gitops-demo-fe
```

Open [http://localhost:8080](http://localhost:8080).

Test the health endpoint:

```sh
curl http://localhost:8080/health
```

It returns `OK`.

## Continuous integration

The workflow pushes images to the `gitops-demo-fe` ECR repository:

| Source | Image tag |
| --- | --- |
| Push to `dev` | `dev-<short-sha>` |
| Push to `uat` | `uat-<short-sha>` |
| Manual run from `main` | `production-<short-sha>` |

Required GitHub secrets:

```text
AWS_ACCOUNT_ID
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
```

The workflow creates the ECR repository if it does not already exist.
