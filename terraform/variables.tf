variable "do_token" {
  description = "API token used by DigitalOcean"
  type        = string
}

variable "do_region" {
  description = "Region where the resources are created"
  type        = string
  default     = "fra1"
}

variable "cloudflare_api_token" {
  type = string
}

variable "cloudflare_zone_id" {
  type = string
}

variable "cloudflare_domain" {
  type    = string
  default = "example.com"
}

variable "mgmt_ssh_key_path" {
  type    = string
  default = "~/.ssh/id_sze-linux_mgmt_ed25519"
}
