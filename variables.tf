variable "key_name" {
  type        = string
  description = "provide key name to ssh in the instance if required"
}

variable "AWS_SECRET_KEY" {
  default = "tE5ZVqw5xibbq6hlPGw63BN6Ou1tmcVPzrRvQ75t"
}

variable "AWS_VERSION" {
  default = "<= 2.6"

}

variable "AWS_ACCESS_KEY" {
  default = "AKIA5MO3WSVERSJTB3MP"
}

variable "cluster_name" {
  type        = string
  description = "name of the aws cluster you want to create"
}
