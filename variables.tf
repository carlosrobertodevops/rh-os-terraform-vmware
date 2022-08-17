variable "vsphere_server" {
  description = "vSphere server"
  type        = string
}

variable "vsphere_user" {
  description = "vSphere username"
  type        = string
}

variable "vsphere_password" {
  description = "vSphere password"
  type        = string
  sensitive   = true
}

variable "datacenter" {
  type = string
}

variable "datastore" {
  type = string
}

variable "cluster" {
  type = string
}

variable "network_name" {
  type = string
}

variable "net_adapter_type" {
  type = string
}

variable "guest_id" {
  type = string
}

variable "custom_iso_so_path" {
  type = string
}

variable "name_new_vm" {
  description = "Input a name for Virtual Machine Ex. new_vm"
  type        = string
}

variable "vm_count" {
  description = "Number of instaces"
  type        = string
}

variable "disk_size" {
  description = "Amount of Disk, Ex. 50, 60, 70 OBS: The amount may not be less than 50"
  type        = string
}

variable "num_cpus" {
  description = "Amount of vCPU's, Ex. 2"
  type        = string
}

variable "memory" {
  description = "Amount of Memory, Ex. 1024, 2048, 3073, 4096"
  type        = string
}