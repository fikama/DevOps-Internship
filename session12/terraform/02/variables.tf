variable "location" {
  type = string
}
variable "vnetName" {
  type = string
}
variable "addressSpace" {
  type = string
}
variable "group" {
  type = string
}
variable "arrayOfSubnets" {
  type = list(any)
}
