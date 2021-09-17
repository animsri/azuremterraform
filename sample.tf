module "subnet" {
  source              = "../../modules/subnet"
  resource_group_name = "${var.vnet_resource_group_name}"
  location            = "${var.location}"
  tags                = "${merge(var.default_tags,tomap({"type"="cda subnet"}))}"
  vnet_name           = "${var.vnet_name}"
  add_endpoint        =  false
  subnets = [
    {
      name   = "${local.subnet_name}"
      prefix = "${var.vm_subnet_prefix}"
    }
  ]
}

module "nsg" {
  source              = "../../modules/network-security-group"
  nsg_name            = "${local.nsg_name}"
  resource_group_name = "${module.resource_group.resource_group_name}"
  location            = "${var.location}"
  tags                = "${merge(var.default_tags,tomap({type="cda-nsg"}))}"

  depends_on = [
   module.resource_group
  ]
}


module "disk" {
  source              = "../../modules/disk"
  disk_name           = "${local.vm_name}"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.resource_group_name}"
  disk_size           = "${var.disk_size}"
  tags                = "${merge(var.default_tags,tomap({type="application-disk"}))}"

  depends_on = [
    module.resource_group,
  ]
}


module "vm" {
  source              = "../../modules/virtual-machine"
  server_name         = "${local.vm_name}"
  location            = "${var.location}"
  resource_group_name = "${module.resource_group.resource_group_name}"
  subnet_id           = "${module.subnet.id}"
  vm_size             = "${var.vm_size}"
  tags                = "${merge(var.default_tags,tomap({type="application-server"}))}"
  managed_disk_id     = "${module.disk.id}"
  network_security_group_id = "${module.nsg.id}"
  
}