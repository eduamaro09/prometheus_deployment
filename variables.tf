variable "zone" {
    type = string
    default = "us-east-1"
  
}

variable "tags" {
    type = map
    default = {
        "Project" = "PITA",
        "Environment" = "Dev"
    }
}

variable "project_name" {
    type = string
    default = "prometheus"
  
}