variable "vmName" {
  type = string
}
variable "vmImage" {
  type = object({ publisher = string, offer = string, sku = string, version = string })
}
variable "vmPricingTier" {
  type = string
}
variable "vmDiskPricingTier" {
  type = string
}
variable "vnetName" {
  type = string
}
variable "subnetName" {
  type = string
}
variable "group" {
  type = string
}
variable "location" {
  type = string
}