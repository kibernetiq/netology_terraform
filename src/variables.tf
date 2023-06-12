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

variable "public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDPvvD+VqC+CqvR+kDLnraxgaGF6q+nJMaCiqcPWl6h18Bz9mYA7vw2S03xXNCsalPu7T/Qt6W11yLzSVTLDfeh6cfovCvNRfnw79x2qsMLSwHrImqYR8g/NNUsCCN0EJnJWMFnXWRfEkNK3r1gxCNBBsNZPlIlNYBLhf/uwMl73WHydaVZgGmtqdXR3kvfq7akPLJnyZmXuFtpP/Ql+I+0s4ZCYfc75kYmJTmKCnZY4ixr6NeTRm9hNep/8rPfxYKf19e47EdoG/Lxu6P/WbTAGXshh7m+SXmV9P+oK4LggbKAj5LhyZ4wMQi3ZG/LCFXWpMVioSqJp4ny/s1L12BV"
}