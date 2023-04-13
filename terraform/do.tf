terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "web" {
  image = "ubuntu-22-04-x64"
  name  = "sze-linux-web"
  region = "fra1"
  size = "g-2vcpu-8gb"
}
