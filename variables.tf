variable "env" {
  type = string
  description = "environment name"
}

variable "auto_scaling_group_arn" {
  type = string
  description = "Auto scaliing group ARN"
}

variable "target_capacity" {
  type = number
  description = "target capacity "
}


variable "network_mode" {
  description = "Network mode for task definition"
  type        = string
  default     = "default"

}


variable "execution_role_arn" {
  description = "Execution role arn for task definition"
  type        = string
  sensitive   = true
}

variable "image_name" {
  description = "Image name for the task definition"
  type        = string
  sensitive   = true
}

variable "cpu_capacity" {
  description = "Required cpu for the task"
  type        = number
}

variable "memory_capacity" {
  description = "Required cpu for the task"
  type        = number
}

variable "container_port" {
  description = "Container port number"
  type        = number
}

variable "subnet_ids" {
  description = "Subnet ids for ecs service"
  type        = list(string)
}

variable "security_groups" {
  description = "Security groups for ecs service"
  type        = list(string)
}

variable "target_group_arn" {
  description = "Target group arn for the ecs service"
  type        = string
}

variable "asg_id" {
  description = "ASG id for dependency"
  type        = string
}