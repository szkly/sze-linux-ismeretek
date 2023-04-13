terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.3.0"
    }
  }
}
provider "digitalocean" {
  token = var.do_token
}

provider "cloudflare" {
  email = var.cloudflare_email
  token = var.cloudflare_api_key
}