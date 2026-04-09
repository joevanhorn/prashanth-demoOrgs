# =============================================================================
# OKTA APPS - Placeholder bookmark apps for the Acme Corp demo
# =============================================================================
# Bookmark apps link to nothing real -- they exist to demonstrate SSO tile
# assignment and app scoping in Okta. All URLs use the RFC 2606 reserved
# .example TLD so they will never resolve.
# =============================================================================

locals {
  bookmark_apps = {
    "Acme CRM"         = { url = "https://crm.acme-demo.example",     logo = "acme-crm.png" }
    "Acme HR Portal"   = { url = "https://hr.acme-demo.example",      logo = "acme-hr-portal.png" }
    "Acme Finance Hub" = { url = "https://finance.acme-demo.example", logo = "acme-finance-hub.png" }
    "Acme Wiki"        = { url = "https://wiki.acme-demo.example",    logo = "acme-wiki.png" }
    "Acme Ticketing"   = { url = "https://tickets.acme-demo.example", logo = "acme-ticketing.png" }
  }
}

resource "okta_app_bookmark" "acme" {
  for_each = local.bookmark_apps

  label  = each.key
  url    = each.value.url
  logo   = "${path.module}/logos/${each.value.logo}"
  status = "ACTIVE"
}
