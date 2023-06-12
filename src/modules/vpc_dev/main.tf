terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

resource "yandex_vpc_network" "develop" {
  name = var.env_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.env_name
  network_id     = var.network_id
  zone           = var.zone
  v4_cidr_blocks = [var.cidr]
}



variable "env_name" {
  type        = string
  description = "VPC network&subnet name"
}
variable "zone" {
  type        = string
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "cidr" {
  type        = string
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "network_id" {
  type = string
}
