# target-ps Okta org

Generic Acme Corp demo environment. Identical twin of `source-ps`.

- **Tenant**: `target-ps.oktapreview.com`
- **State**: `s3://taskvantage-prod-tf-state/prashanth-demoOrgs/target-ps/terraform.tfstate` (us-east-2)
- **GitHub Environment**: `target-ps` (secrets: `OKTA_API_TOKEN`, `OKTA_ORG_NAME`, `OKTA_BASE_URL`)

See `environments/source-ps/README.md` for the full resource breakdown — this
environment is an exact mirror, differing only in the backend state key.

## Deploy

```bash
gh workflow run tf-plan.yml  -f environment=target-ps
gh workflow run tf-apply.yml -f environment=target-ps
```
