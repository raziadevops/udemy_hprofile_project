variable region {
  type        = string
  default     = "us-east-1"
}
variable zones {
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
} 
variable vpc_cidr {
  type        = string
  default     = "10.100.0.0/20"
}
variable "subnet_cidrs" {
  type    = list(string)
  default = ["10.100.0.0/24", "10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24"]

}

