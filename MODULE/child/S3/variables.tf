variable "bucket_name" {
  type = string
  default = ""
}

variable "bucket_tags" {
  type = map(any)
  default = {}
}

variable "bucket_version" {
  type = string
  default = "Enabled"
}

