variable "client_id" {
  type      = string
  sensitive = true
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "tenant" {
  type      = string
  sensitive = true
}

variable "output_resource_group"{
  type      = string
  sensitive = false
}

variable "subscription_id" {
  type      = string
  sensitive = false
}

variable "storage_account"{
  type      = string
  sensitive = false
}