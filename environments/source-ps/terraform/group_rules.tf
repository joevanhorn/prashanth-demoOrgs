# =============================================================================
# OKTA GROUP RULES - Auto-assignment rules for all 15 demo groups
# =============================================================================
# Rules use Okta Expression Language to evaluate user profile attributes.
# Users are added to matching groups automatically as rules run.
# =============================================================================

# --- Department rules --------------------------------------------------------
locals {
  department_rule_expressions = {
    "Engineering Team"     = "user.department==\"Engineering\""
    "Sales Team"           = "user.department==\"Sales\""
    "Marketing Team"       = "user.department==\"Marketing\""
    "Finance Team"         = "user.department==\"Finance\""
    "Human Resources Team" = "user.department==\"Human Resources\""
  }
}

resource "okta_group_rule" "departments" {
  for_each = local.department_rule_expressions

  name              = "${each.key} Auto-Assignment"
  status            = "ACTIVE"
  group_assignments = [okta_group.departments[each.key].id]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = each.value
}

# --- Location rules ----------------------------------------------------------
resource "okta_group_rule" "locations" {
  for_each = local.location_groups

  name              = "${each.key} Auto-Assignment"
  status            = "ACTIVE"
  group_assignments = [okta_group.locations[each.key].id]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "user.city==\"${each.value.city}\""
}

# --- Functional rules --------------------------------------------------------
resource "okta_group_rule" "all_employees" {
  name              = "All Employees Auto-Assignment"
  status            = "ACTIVE"
  group_assignments = [okta_group.functional["All Employees"].id]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "String.len(user.login) > 0"
}

resource "okta_group_rule" "managers" {
  name              = "Managers Auto-Assignment"
  status            = "ACTIVE"
  group_assignments = [okta_group.functional["Managers"].id]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "String.stringContains(user.title, \"Manager\")"
}

resource "okta_group_rule" "contractors" {
  name              = "Contractors Auto-Assignment"
  status            = "ACTIVE"
  group_assignments = [okta_group.functional["Contractors"].id]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "user.organization==\"Acme External\""
}

resource "okta_group_rule" "it_admins" {
  name              = "IT Admins Auto-Assignment"
  status            = "ACTIVE"
  group_assignments = [okta_group.functional["IT Admins"].id]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "String.stringContains(user.title, \"Systems Administrator\")"
}

resource "okta_group_rule" "executives" {
  name              = "Executives Auto-Assignment"
  status            = "ACTIVE"
  group_assignments = [okta_group.functional["Executives"].id]
  expression_type   = "urn:okta:expression:1.0"
  expression_value  = "String.stringContains(user.title, \"VP \") or String.stringContains(user.title, \"Chief \")"
}
