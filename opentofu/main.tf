terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}

provider "cloudflare" {
  api_token = var.api_token
}

variable "api_token" {
  description = "Cloudflare API Token"
  type        = string
  sensitive   = true
}

variable "zone_id" {
  description = "Cloudflare Zone ID"
  type        = string
  sensitive   = true
}

variable "domains" {
  type        = set(string)
  default     = [ "@", "overflow", "mozhi", "redlib", "search", "sftpgo" ]
}

resource "cloudflare_dns_record" "records" {
  for_each = var.domains

  zone_id = var.zone_id
  name    = each.value
  type    = "A"
  content = "138.201.244.50"
  ttl     = 1
  proxied = false
}

