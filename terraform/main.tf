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
    ansible_host                 = digitalocean_droplet.do_droplet_web.ipv4_address
    ansible_user                 = "mgmt"
    ansible_ssh_private_key_file = var.mgmt_ssh_key_path
    ansible_python_interpreter   = "/usr/bin/python3"
  }
}

resource "null_resource" "configuration" {
  provisioner "remote-exec" {
    connection {
      host        = digitalocean_droplet.do_droplet_web.ipv4_address
      user        = "mgmt"
      private_key = file(var.mgmt_ssh_key_path)
    }

    inline = ["cloud-init status --wait > /dev/null 2>&1", "echo 'Ready to go!'"]
  }

  provisioner "local-exec" {
    command = "ANSIBLE_FORCE_COLOR=1 ANSIBLE_CONFIG='../ansible/ansible.cfg' ansible-playbook ../ansible/main.yml"
  }
}
