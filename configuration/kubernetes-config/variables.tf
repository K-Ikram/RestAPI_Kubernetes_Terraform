variable "cluster" {
  default = "apparent-duck-aks"
}
variable "app" {
  type        = string
  description = "Name of application"
  default     = "my-api"
}

variable "docker-image" {
  type        = string
  description = "ikrambk27/booksapi:1.0.1"
  default     = "ikrambk27/booksapi:1.0.1"
}

variable "db" {
  type        = string
  description = "mogodb"
  default     = "mongodb-deployment"
}

variable "db-image" {
  type        = string
  description = "mogodb docker image"
  default     = "mongo"
}
variable "mongo_db_port" {
        type = number   
        description = "Mongo DB Server Port"
        default = 27017
}