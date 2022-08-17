# Configure the vSphere Provider
provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_user
  password             = var.vsphere_password
  allow_unverified_ssl = true
}

# Build New VM
data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "networking" {
  name          = var.network_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vm" {
  count = var.vm_count
  //name                       = "${var.name_new_vm}-${count.index + 1}"
  name                       = "${var.name_new_vm}-bootstrap"
  resource_pool_id           = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id               = data.vsphere_datastore.datastore.id
  force_power_off            = true
  shutdown_wait_timeout      = 1
  num_cpus                   = var.num_cpus
  memory                     = var.num_mem
  wait_for_guest_net_timeout = 0
  guest_id                   = var.guest_id
  nested_hv_enabled          = true

  network_interface {
    network_id   = data.vsphere_network.networking.id
    adapter_type = var.net_adapter_type
  }

  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = var.custom_iso_so_path
  }

  disk {
    label            = "disk0"
    size             = var.disk_size
    # eagerly_scrub    = false
    # thin_provisioned = true
  }
}

# output "vm_ip" {
#   value = vsphere_virtual_machine.okd4.guest_ip_addresses
# }