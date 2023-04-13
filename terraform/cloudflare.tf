terraform {
  required_providers {
    cloudflare = {
      source = "cloudflare/cloudflare"
      version = "4.3.0"
    }
  }
}

provider "cloudflare" {
  email = var.cloudflare_email
  token = var.cloudflare_api_key
}

resource "cloudflare_record" "do_droplet" {
  domain  = "${var.cloudflare_domain}"
  name    = "*"
  value   = "203.0.113.10"
  type    = "A"
}
