variable "client" {
    description = "Client of TCS for which the resources are created"
    type = string  
}

variable "environment" {
    description = "the environment for which the resources are created"
    type = string
}

variable "resourcegroupname" {
    description = "Contains the resource group name"
    type = string
}

variable "resourcegrouplocation" {
    description = "Contains the resource group location" 
    type = string
}

variable "node_count" {
    description = "Contains the number of nodes"
    type = number
}

variable "client_id" {
    description = "Contains the client id"
    type = string 
}

variable "client_secret" {
  description = "Azure Kubernetes Service Cluster password" 
  type        = string
  sensitive   = true
}

variable "dns_prefix" {
    description = "Contains the dns prefix for the kubernetes cluster"
    type = string
}

variable "cluster_name" {
    description = "Contains the name of the cluster"
    type = string
}
