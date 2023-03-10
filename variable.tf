#prevent hardcoding
#prevent us from exposing companies important secret
#also make our code very dynamic

variable "region" {
  description = "region where we provisioning our resources"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "variable for vpc cidr"
  type        = string
  default     = "10.0.0.0/16"
}
variable "prime-pub1-cidr" {
  description = "cidr block for public sn"
  type        = string
  default     = "10.0.1.0/24"
}

variable "prime_pub1-az" {
  description = "avaliability zone"
  type        = string
  default     = "us-east-1a"

}

variable "prime-pub2-cidr" {
  description = "cidr block for public sn"
  type        = string
  default     = "10.0.2.0/24"
}

variable "prime_pub2-az" {
  description = "avaliability zone"
  type        = string
  default     = "us-east-1b"

}

variable "prime-private1-cidr" {
  description = "cidr block for public sn"
  type        = string
  default     = "10.0.3.0/24"
}

variable "prime_private1-az" {
  description = "avaliability zone"
  type        = string
  default     = "us-east-1a"

}

variable "prime-private2-cidr" {
  description = "cidr block for public sn"
  type        = string
  default     = "10.0.4.0/24"
}

variable "prime_private2-az" {
  description = "avaliability zone"
  type        = string
  default     = "us-east-1b"

}

