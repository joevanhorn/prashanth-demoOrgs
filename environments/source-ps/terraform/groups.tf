# =============================================================================
# OKTA GROUPS - 15 demo groups (departments + locations + functional)
# =============================================================================
# All group memberships are managed dynamically via group rules in
# group_rules.tf based on user profile attributes.
# =============================================================================

locals {
  department_groups = {
    "Engineering Team"    = "Engineering department"
    "Sales Team"          = "Sales department"
    "Marketing Team"      = "Marketing department"
    "Finance Team"        = "Finance department"
    "Human Resources Team" = "Human Resources department"
  }

  location_groups = {
    "Location - US East" = { city = "New York",     description = "Users based in the US East region" }
    "Location - US West" = { city = "San Francisco", description = "Users based in the US West region" }
    "Location - EMEA"    = { city = "London",       description = "Users based in EMEA" }
    "Location - APAC"    = { city = "Tokyo",        description = "Users based in APAC" }
    "Location - LATAM"   = { city = "São Paulo",    description = "Users based in LATAM" }
  }

  functional_groups = {
    "All Employees" = "All active users in the demo org"
    "Managers"      = "Anyone with 'Manager' in their title"
    "Contractors"   = "External contractors (organization == Acme External)"
    "IT Admins"     = "Users with Systems Administrator role"
    "Executives"    = "VPs and C-level executives"
  }
}

resource "okta_group" "departments" {
  for_each    = local.department_groups
  name        = each.key
  description = each.value
}

resource "okta_group" "locations" {
  for_each    = local.location_groups
  name        = each.key
  description = each.value.description
}

resource "okta_group" "functional" {
  for_each    = local.functional_groups
  name        = each.key
  description = each.value
}
