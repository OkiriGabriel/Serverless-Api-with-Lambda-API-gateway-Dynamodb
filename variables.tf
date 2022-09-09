variable "region" {
  description = "my region"
  type = string
  default = "us-east-1"
}

variable "name" {
  default = "myTable"
}

variable "hash_key" {
  default = "id"
}

variable "billing_mode" {
  default = "PROVISIONED"
}

variable "read_capacity" {
  default = 5
}

variable "write_capacity" {
  default = 5
}

