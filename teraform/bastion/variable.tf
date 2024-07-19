variable "resource_group_name" {
  type    = string
  default = ""
}

variable "location" {
  type    = string
  default = ""
}

variable "subnet_name" {
  type    = string
  default = ""
}

variable "vnet_name" {
  type    = string
  default = ""
}

variable "vnet_rg_name" {
  type    = string
  default = "rg-testing-dev-ci-01"
}

variable "pip_name" {
  type    = string
  default = ""
}

variable "bst_name" {
  type    = string
  default = ""
}

variable "sku" {
  type    = string
  default = ""
}

variable "scale_units" {
  type    = number
}

variable "copy_paste_enabled" {
  type    = bool
  default = false
}

variable "file_copy_enabled" {
  type    = bool
  default = false
}

variable "shareable_link_enabled" {
  type    = bool
  default = false
}

variable "tunneling_enabled" {
  type    = bool
  default = false
}

variable "ip_connect_enabled" {
  type    = bool
  default = false
}

variable "tags" {
  type    = any
  
}
