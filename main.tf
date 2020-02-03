/*
 * Copyright (c) 2019 Netic A/S. All rights reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

locals {
  tags = {
    Terraform = "true"
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_connection_limit_warning" {
  count                     = var.enable_monitoring ? 1 : 0
  alarm_name                = "database connection limit warning"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "DatabaseConnections"
  namespace                 = "AWS/RDS"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = var.connection_limit_warning_threshold
  alarm_description         = "RDS: ${var.connection_limit_warning_threshold}/${var.max_connections} of available database connections are used."
  insufficient_data_actions = []
  alarm_actions             = [var.sns_topic]
  ok_actions                = [var.sns_topic]

  dimensions = {
    DBClusterIdentifier = var.cluster_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_connection_limit_critical" {
  count                     = var.enable_monitoring ? 1 : 0
  alarm_name                = "database connection limit critical"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "DatabaseConnections"
  namespace                 = "AWS/RDS"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = var.connection_limit_critical_threshold
  alarm_description         = "RDS: ${var.connection_limit_critical_threshold}/${var.max_connections} of available database connections are used."
  insufficient_data_actions = []
  alarm_actions             = [var.sns_topic]
  ok_actions                = [var.sns_topic]

  dimensions = {
    DBClusterIdentifier = var.cluster_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_connection_read_latency_warning" {
  count                     = var.enable_monitoring ? 1 : 0
  alarm_name                = "database read latency to high"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "ReadLatency"
  namespace                 = "AWS/RDS"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = var.connection_read_latency_warning_threshold
  alarm_description         = "RDS: Read latency exceeds ${var.connection_read_latency_warning_threshold*1000}ms"
  insufficient_data_actions = []
  alarm_actions             = [var.sns_topic]
  ok_actions                = [var.sns_topic]

  dimensions = {
    DBClusterIdentifier = var.cluster_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_connection_write_latency_warning" {
  count                     = var.enable_monitoring ? 1 : 0
  alarm_name                = "database write latency to high"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "WriteLatency"
  namespace                 = "AWS/RDS"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = var.connection_write_latency_warning_threshold
  alarm_description         = "RDS: Write latency exceeds ${var.connection_write_latency_warning_threshold*1000}ms"
  insufficient_data_actions = []
  alarm_actions             = [var.sns_topic]
  ok_actions                = [var.sns_topic]

  dimensions = {
    DBClusterIdentifier = var.cluster_identifier
  }
}
