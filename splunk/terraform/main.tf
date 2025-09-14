terraform {
  required_providers {
    signalfx = {
      source = "splunk-terraform/signalfx"
      version = "~> 9.20.0"
    }
  }
}

provider "signalfx" {
  auth_token = "${var.signalfx_auth_token}"
  api_url =  "https://api.${var.realm}.signalfx.com"
}
