variable "my-UPN" {
    default = "afsahsiddiqui@xyz.com"
}

variable "my-display_name" {
    default = "Afsah S."
}

variable "trainer-UPN" {
    default = "ibrahimozbekler@xyz.com"
}

variable "trainer-display_name" {
    default = "Ibrahim O."
}

variable "users" {
    default = ["Harsimranjit", "Keerti", "David", "Rob"]
}

variable "total-buckets" {
    default = 2
}

variable "bucket-name" {
    default = "mybucket"
}

variable "resource-group-name" {
    default = "badminton"
}

variable "rg-location" {
    default = "West Europe"
}

variable "vm-name" {
    default = "my-virtualmachine"
}

variable "ni-name" {
    default = "my-networkinterface"
}

variable "sbn-name" {
    default = "my-subnet"
}

variable "vnetwork-name" {
    default = "my-virtualnetwork"
}

variable "address_space" {
    default = ["10.0.0.0/16"]
}

variable "address_prefixes" {
    default = ["10.0.2.0/24"]
}

variable "ip-config-name" {
    default = "configuration01"
}

variable "ip_allocation_type" {
    default = "Dynamic"
}

variable "sa_name" {
    default = "mystorageaccount"
}

variable "vm-size" {
    default = "Standard_DS1_v2"
}

variable "disk-name" {
    default = "my_osdisk"
}

variable "rw" {
    default = "ReadWrite"
}

variable "createfrom" {
    default = "FromImage"
}

variable "disktype" {
    default = "Standard_LRS"
}

variable "sa-tier" {
    default = "Standard"
}

variable "rep_type" {
    default = "GRS"
}

variable "dev-env" {
    default = "Dev"
}

variable "staging-env" {
    default = "Staging"
}