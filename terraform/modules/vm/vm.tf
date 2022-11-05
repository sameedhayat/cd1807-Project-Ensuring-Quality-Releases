resource "azurerm_network_interface" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_type}"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${azurerm_subnet.test.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.test.id}"
  }
}


resource "azurerm_linux_virtual_machine" "test" {
  name                = "${var.application_type}-${var.resource_type}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_type}"
  size                = "Standard_DS2_v2"
  admin_username      = "sameed"
  network_interface_ids = [azurerm_network_interface.test.id]
  admin_ssh_key {
    username   = "sameed"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+bYmVvgPdvDbCgLaqO62MeYBtD+OVyAWh17dSlui5WYJqnPE4U1XfpKr5m+V58Kp879vj/c7JnyVwUT4ErFWwe03/MtysB4Yh/bJqlzyzepUysOw92YPWWflZsXvpTbNSdU1EZaDKBGDuf8cKzvJoRsLggEYWqFhTy8y0fWTYJXtT6opAh4vfJZ9ApGhwFUGkbbKXk+avrlIH3/ws6s8APf0a3ETlQytliSQtoIAW4dIKjudiPdMG8fRBpqVuQ04rTM/qyhEP6MD4ryCV/Bw9Q9IH/5uST2Ua2X1zzPLB0rL1uVV1rzyNLVunh2Gy8YHSY1xGYYSDsKBR7wy+kVV7j6OxOFlwvcnnM8jJ/Tjpd6A2UJ5fbqe5Wl4r45N24OeBnYb20c2yJ8xgeKJWRehMQ642Dcw3lfZExJKwEt5kByIsDUxpRr5nmpJZGSz5EKaqL9Gp/r+kTd0NJfDKw4EsyshP038mMW3k4jlARwZJz2+ycPaDey1PwFGHrW5O4B8= asus@LAPTOP-JIVQ2AGJ
"
  }
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
