variable "do_token" {
  description = "API token used by DigitalOcean"
  type = string
}

variable "cloudflare_email" {
  type = string
}

variable "cloudflare_api_key" {
  type = string
}

variable "cloudflare_domain" {
  type = string
  default = "example.com"
}