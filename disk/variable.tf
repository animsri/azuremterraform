variable "disk_name" {
  description = ""
  default     = ""
}
variable "location" {
  description = ""
  default     = ""
}

variable "resource_group_name" {
  description = ""
  default     = ""
}

variable "storage_account_type" {
  description = ""
  default     = "Standard_LRS"
}


variable "disk_size" {
  description = ""
  default = "1"
}

variable "tags" {
    description = ""
    type = map(string)
  
}