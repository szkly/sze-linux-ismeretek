resource "digitalocean_droplet" "do_droplet_web" {
  image     = "ubuntu-22-04-x64"
  name      = "sze-linux-web"
  region    = var.do_region
  size      = "g-2vcpu-8gb"
  user_data = file("${path.module}/cloud-config.yml")
}

resource "cloudflare_record" "cloudflare_do_droplet_record" {
  zone_id = var.cloudflare_zone_id
  name    = "*"
  value   = digitalocean_droplet.do_droplet_web.ipv4_address
  type    = "A"
  ttl     = 60
}

resource "ansible_host" "do_droplet_web" {
  name = "sze-linux-web"

  variables = {
    ansible_user                 = "mgmt"
    ansible_ssh_private_key_file = "~/.ssh/id_sze-linux_mgmt_ed25519"
    ansible_python_interpreter   = "/usr/bin/python3"
  }
}