resource "digitalocean_droplet" "do_droplet_web" {
  image  = "ubuntu-22-04-x64"
  name   = "sze-linux-web"
  region = var.do_region
  size   = "g-2vcpu-8gb"
}

resource "cloudflare_record" "cloudflare_do_droplet_record" {
  zone_id = var.cloudflare_zone_id
  name   = "*"
  value  = digitalocean_droplet.do_droplet_web.ipv4_address
  type   = "A"
  ttl    = 60
}