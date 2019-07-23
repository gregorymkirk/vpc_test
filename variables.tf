variable "vpc-cidr" {}

variable "newbits1" {
  description = "Split between App subnets and Load balancer/data subnets accepted values are 0 or 1"
  default     = "1"
}

#If 0 is selected than the number of data subnets MUST BE 0.
variable "newbits2" {
  description = "Split between Load balancer and data subnets,  accepted values are 0 or 1"

  default = "1"
}

# a vlaue of 1 provides up to 2 subnets, a value of 2 up to 4
# Makes sure the number of subnets does not exeed the number abailable
variable "app_newbits" {
  description = "Additional Bits to subdivide the App subnet address space"
  default     = "1"
}

variable "app_subnets" {
  description = "Number of App subnets to create"
  default     = "2"
}

# a vlaue of 1 provides up to 2 subnets, a value of 2 up to 4
# Makes sure the number of subnets does not exeed the number abailable
variable "lb_newbits" {
  description = "Additions Bits to subdivide the load balancer subnet address space"
  default     = "1"
}

variable "lb_subnets" {
  description = "Number of load balancer subnets to create"
  default     = "2"
}

# a vlaue of 1 provides up to 2 subnets, a value of 2 up to 4
# Makes sure the number of subnets does not exeed the number abailable
variable "data_newbits" {
  description = "Additional Bits to subdivide the database subnet address space"
  default     = "1"
}

variable "data_subnets" {
  description = "Number of database subnets to create"
  default     = "2"
}
