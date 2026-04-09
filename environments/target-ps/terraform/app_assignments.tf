# =============================================================================
# OKTA APP ASSIGNMENTS - Group-based app scoping
# =============================================================================
# Each bookmark app is scoped to one or more groups. Users receive app tiles
# transitively through the group rules defined in group_rules.tf.
# =============================================================================

# Acme CRM -> Sales + Marketing
resource "okta_app_group_assignments" "acme_crm" {
  app_id = okta_app_bookmark.acme["Acme CRM"].id

  group {
    id = okta_group.departments["Sales Team"].id
  }
  group {
    id = okta_group.departments["Marketing Team"].id
  }
}

# Acme HR Portal -> All Employees
resource "okta_app_group_assignments" "acme_hr_portal" {
  app_id = okta_app_bookmark.acme["Acme HR Portal"].id

  group {
    id = okta_group.functional["All Employees"].id
  }
}

# Acme Finance Hub -> Finance + Executives
resource "okta_app_group_assignments" "acme_finance_hub" {
  app_id = okta_app_bookmark.acme["Acme Finance Hub"].id

  group {
    id = okta_group.departments["Finance Team"].id
  }
  group {
    id = okta_group.functional["Executives"].id
  }
}

# Acme Wiki -> All Employees
resource "okta_app_group_assignments" "acme_wiki" {
  app_id = okta_app_bookmark.acme["Acme Wiki"].id

  group {
    id = okta_group.functional["All Employees"].id
  }
}

# Acme Ticketing -> Engineering + IT Admins
resource "okta_app_group_assignments" "acme_ticketing" {
  app_id = okta_app_bookmark.acme["Acme Ticketing"].id

  group {
    id = okta_group.departments["Engineering Team"].id
  }
  group {
    id = okta_group.functional["IT Admins"].id
  }
}
