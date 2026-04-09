variable "okta_org_name" {
  description = "Okta organization subdomain (e.g., source-ps)"
  type        = string
}

variable "okta_base_url" {
  description = "Okta base URL (okta.com or oktapreview.com)"
  type        = string
  default     = "oktapreview.com"
}

variable "okta_api_token" {
  description = "Okta API token with Org Admin or Super Admin scope"
  type        = string
  sensitive   = true
}
