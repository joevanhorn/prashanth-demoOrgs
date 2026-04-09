# =============================================================================
# OKTA USERS - 50 Acme Corp demo users loaded from users.csv
# =============================================================================
# CSV-driven user management. Email is the unique key; login == email.
# Passwords are not set -- users will go through Okta activation on first login.
# =============================================================================

locals {
  csv_users = csvdecode(file("${path.module}/users.csv"))
  users_map = { for u in local.csv_users : u.email => u }
}

resource "okta_user" "acme" {
  for_each = local.users_map

  email        = each.value.email
  login        = each.value.email
  first_name   = each.value.first_name
  last_name    = each.value.last_name
  department   = each.value.department
  title        = each.value.title
  city         = each.value.city
  country_code = each.value.country_code
  organization = each.value.organization

  # Don't churn on manager changes made in the UI
  lifecycle {
    ignore_changes = [manager_id, manager, password]
  }
}
