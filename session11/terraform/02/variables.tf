variable "location" {
  type    = string
  default = "uksouth"
}
variable "serverName" {
  type    = string
  default = "mssqlserver246"
}
variable "dbName" {
  type    = string
  default = "dbName"
}
variable "pricingTier" {
  type    = string
  default = "S0"
}
variable "dbBackupPolicy" {
  type    = string
  default = "Local"
}

variable "firewallRules" {
  type = list(any)
  default = [
    {
      name  = "rulenum1",
      start = "1.0.0.1",
      end   = "1.0.0.1"
    },
    {
      name  = "rulenum2",
      start = "1.1.1.1",
      end   = "1.1.1.1"
    },
    {
      name  = "rulenum3",
      start = "8.8.8.8",
      end   = "8.8.8.8"
    }
  ]
}