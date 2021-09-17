variable "resource_group_name" {
  description = ""
  default     = ""
}
variable "nsg_name" {
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
