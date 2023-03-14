variable "agName" {
  type = string
}
variable "wafRules" {
  type = object({ name = string, file_upload_limit_mb = number, firewall_mode = string, max_request_body_size_kb = number, request_body_check = bool, rule_set_type = string, rule_set_version = number })
}
variable "endpoints" {
  type = list(object({ name = string }))
}



variable "vnetName" {
  type = string
}
variable "frontSubnetName" {
  type = string
}
variable "backSubnetName" {
  type = string
}
variable "group" {
  type = string
}
variable "location" {
  type = string
}