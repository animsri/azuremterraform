variable "server_name" {
    description = ""
    default = ""
}
variable "resource_group_name" {
  description = ""
  default     = ""
}

variable "location" {
  description = ""
  default     = ""
}

variable "tags" {
  description = "The tags to associate the resource we are creating"
  type        = map(string)
  default     = {}
}

variable "subnet_id" {
    description = ""
    default = ""
}

variable "vm_size" {
    description = ""
    default = ""
}

variable "managed_disk_id" {
    description = ""
    default = ""
}

variable "network_security_group_id" {
    description = ""
    default = ""
  
}