# =============================================================================
# OKTA APPS - Placeholder bookmark apps for the Acme Corp demo
# =============================================================================
# Bookmark apps link to nothing real -- they exist to demonstrate SSO tile
# assignment and app scoping in Okta. All URLs use the RFC 2606 reserved
# .example TLD so they will never resolve.
# =============================================================================

locals {
  bookmark_apps = {
    "Acme CRM"         = "https://crm.acme-demo.example"
    "Acme HR Portal"   = "https://hr.acme-demo.example"
    "Acme Finance Hub" = "https://finance.acme-demo.example"
    "Acme Wiki"        = "https://wiki.acme-demo.example"
    "Acme Ticketing"   = "https://tickets.acme-demo.example"
  }
}

resource "okta_app_bookmark" "acme" {
  for_each = local.bookmark_apps

  label = each.key
  url   = each.value
  status = "ACTIVE"
}
