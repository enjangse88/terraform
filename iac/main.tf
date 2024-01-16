provider "vsphere" {
  user           = ""
  password       = ""
  vsphere_server = ""
}

data "vsphere_datacenter" "dc" {
  name = "uzbkt-dcb"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "uzbkt-dcb-edge"
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "vm" {
  name             = "tf-vm"
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id

  num_cpus  = 2
  memory    = 2048
  guest_id  = "other3xLinux64Guest"

  network_interface {
    network_id   = "all-dmz"
    adapter_type = "vmxnet3"
  }

  disk {
    label            = "disk0"
    size             = 20
    eagerly_scrub    = true
    thin_provisioned = true
  }

}
