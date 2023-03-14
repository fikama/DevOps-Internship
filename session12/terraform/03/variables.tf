variable "location" {
  type = string
}
variable "group" {
  type = string
}
variable "nsgName" {
  type = string
}
variable "arrayOfRules" {
  type = list(any)
}
