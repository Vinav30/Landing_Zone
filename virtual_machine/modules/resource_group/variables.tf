variable "rgs-vinav" {
  type = map(object({
    name     = string
    location = string
  }))
}