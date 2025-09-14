variable "signalfx_auth_token" {
  type = string
}

variable "realm" {
  type = string
}

variable "alert_name" {
 type = string
  default = "pod_failed"
}