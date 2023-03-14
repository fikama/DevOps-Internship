variable "location" {
  type = string
}
variable "group" {
  type = string
}
variable "appServiceName" {
  type = string
}
variable "pricingTier" {
  type = string
}
variable "numOfNodes" {
  type = number
}
variable "dockerImage" {
  type = string
}
variable "storageAccountName" {
  type = string
}
variable "schedule" {
  type = object({ frequency_interval = number, frequency_unit = string, retentionPolicy = number })
}