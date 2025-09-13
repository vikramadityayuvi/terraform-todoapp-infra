variable "aks_name" {}
variable "location" {}
variable "rg_name" {}
variable "dns_prefix" {}
variable "tags" {}

variable "node_count" {
 
  default     = 1
  
}

variable "vm_size" {
 
  default     = "Standard_D2_v2"
  
}