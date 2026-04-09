# source-ps Okta org

Generic Acme Corp demo environment. Identical twin of `target-ps`.

- **Tenant**: `source-ps.oktapreview.com`
- **State**: `s3://taskvantage-prod-tf-state/prashanth-demoOrgs/source-ps/terraform.tfstate` (us-east-2)
- **GitHub Environment**: `source-ps` (secrets: `OKTA_API_TOKEN`, `OKTA_ORG_NAME`, `OKTA_BASE_URL`)

## What gets created

| Resource | Count | Source file |
|---|---|---|
| Users | 50 | `users.csv` + `users.tf` |
| Groups | 15 | `groups.tf` |
| Group rules | 15 | `group_rules.tf` |
| Bookmark apps | 5 | `apps.tf` |
| App→group assignments | 7 | `app_assignments.tf` |

### Groups (15)
- **Departments (5):** Engineering Team, Sales Team, Marketing Team, Finance Team, Human Resources Team
- **Locations (5):** Location - US East / US West / EMEA / APAC / LATAM
- **Functional (5):** All Employees, Managers, Contractors, IT Admins, Executives

### Apps (5, all bookmarks to `.example` URLs)
- Acme CRM → Sales Team, Marketing Team
- Acme HR Portal → All Employees
- Acme Finance Hub → Finance Team, Executives
- Acme Wiki → All Employees
- Acme Ticketing → Engineering Team, IT Admins

## Deploy

```bash
# Via GitHub Actions (preferred)
gh workflow run tf-plan.yml  -f environment=source-ps
gh workflow run tf-apply.yml -f environment=source-ps
```

## Notes

- All user logins use the `@acme-demo.example` domain (RFC 2606 reserved TLD, never resolves).
- Group memberships are **rule-driven**, not statically assigned — users land in groups automatically after creation based on `department`, `city`, `title`, and `organization` profile attributes.
- Same file set exists in `environments/target-ps/` — only `provider.tf` (backend key) differs.
