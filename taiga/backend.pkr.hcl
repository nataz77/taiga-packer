source "azure-arm" "ubuntu-taiga-vhd" {
  # basics
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"  
  subscription_id = "${var.subscription_id}"
  tenant_id = "${var.tenant}"

  # output settings
  resource_group_name = "${var.output_resource_group}"
  storage_account = "${var.storage_account}"
  capture_container_name = "images"
  capture_name_prefix = "taiga-backend"  

  # base image settings
  os_type = "Linux"
  image_publisher = "Canonical"
  image_offer = "UbuntuServer"
  image_sku = "20.04-LTS"

  # temp vm settings
  location = "West Europe"
  vm_size = "Standard_B2s"
}

source "azure-arm" "ubuntu-taiga-managedimage" {
  # basics
  client_id = "${var.client_id}"
  client_secret = "${var.client_secret}"
  subscription_id = "${var.subscription_id}"
  tenant_id = "${var.tenant}"
  
  # base image settings
  os_type = "Linux"
  image_publisher = "Canonical"
  image_offer = "UbuntuServer"
  image_sku = "20.04-LTS"
  
  # temp vm settings
  location = "West Europe"
  vm_size = "Standard_B2s"

  # output settings
  managed_image_name = "taiga-backend"
  managed_image_resource_group_name = "${var.output_resource_group}"
}

build {
  sources = [
    "sources.azure-arm.ubuntu-taiga-vhd"
    "sources.azure-arm.ubuntu-taiga-managedimage"
  ]  
  
  provisioner "shell" {
    scripts = [
      "scripts/requirements.sh"
    ]

    environment_vars = [
      
    ]

    execute_command = "echo 'packer' | sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
  }
}