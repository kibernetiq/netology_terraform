###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "yandex_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "https://cloud.yandex.ru/docs/cli/cli-ref/managed-services/compute/image/"
}

variable "yandex_compute_instance_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "https://cloud.yandex.com/en/docs/cli/cli-ref/managed-services/compute/instance/"
}

variable "name_and_resources_list" {
  type = list(object({
    vm_name = string
    cpu     = number
    ram     = number
    disk    = number
  }))
  default = [
    {
      vm_name = "main"
      cpu     = 4
      ram     = 4
      disk    = 10
    },
    {
      vm_name = "replica"
      cpu     = 2
      ram     = 2
      disk    = 10
    }
  ]
}

data "yandex_compute_image" "ubuntu" {
  family = var.yandex_compute_image
}