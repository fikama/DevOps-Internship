agName = "testvm246"
endpoints = [
  {
    name = "end1"
  },
  {
    name = "end2"
  },
  {
    name = "end3"
  }
]
wafRules = [
  {
    name                     = wafRule1
    file_upload_limit_mb     = 30
    firewall_mode            = Detection
    max_request_body_size_kb = 128
    request_body_check       = true
    rule_set_type            = OWASP
    rule_set_version         = 3.1
  },
  {
    name                     = wafRule2
    file_upload_limit_mb     = 50
    firewall_mode            = Prevention
    max_request_body_size_kb = 248
    request_body_check       = false
    rule_set_type            = OWASP
    rule_set_version         = 3.2
  }
]

vnetName       = "testvnet246"
frotSubnetName = "sub3"
backSubnetName = "sub2"
group          = "test"