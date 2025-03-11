terraform {

    required_version = ">= 0.13.0"

    required_providers {
        proxmox = {
        source = "Telmate/proxmox"
        version = "3.0.1-rc6"
        }
    }
}

# Variable Configuration
Variable "proxmox_api_url" {
    type = string
}

Variable "proxmox_api_token_id" {
    type = string
    sensitive = true
}

Variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
}

provider "proxmox" {
  # Configuration options
}