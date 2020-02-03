/*
 * Copyright (c) 2019 Netic A/S. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

variable "tags" {
  description = "A map of tags to add to all resources"
  default     = {}
}

variable "enable_monitoring" {
  description = "Enable or disable monitoring"
  type        = bool
  default     = true
}

variable "sns_topic" {
  description = "ARN of SNS topic"
  type        = string
}

variable "cluster_identifier" {
  description = "The RDS Cluster Identifier"
  type        = string
}

variable "max_connections" {
  description = "Maximum connections allowed in the cluster"
  type        = number
  default     = 1000
}

variable "connection_limit_warning_threshold" {
  description = "Connection limit warning threshold"
  type        = number
  default     = 900
}

variable "connection_limit_critical_threshold" {
  description = "Connection limit critical threshold"
  type        = number
  default     = 1000
}

variable "connection_read_latency_warning_threshold" {
  description = "Connection read_ atency warning threshold"
  type        = number
  default     = 0.02
}

variable "connection_write_latency_warning_threshold" {
  description = "Connection write latency warning threshold"
  type        = number
  default     = 0.02
}
