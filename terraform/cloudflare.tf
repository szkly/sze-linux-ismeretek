variable "cloudflare_email" {
  type = string
}

variable "cloudflare_api_key" {
  type = string
}

provider "cloudflare" {
  email = var.cloudflare_email
  token = var.cloudflare_api_key
}

variable "cloudflare_domain" {
  default = "example.com"
}

resource "cloudflare_record" "www" {
  domain  = "${var.cloudflare_domain}"
  name    = "www"
  value   = "203.0.113.10"
  type    = "A"
  proxied = true
}
