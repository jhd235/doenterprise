output "workspace_name" {
  description = "Name of the monitoring workspace"
  value       = google_monitoring_workspace.workspace.display_name
}

output "bigquery_dataset_id" {
  description = "ID of the BigQuery dataset for logs"
  value       = google_bigquery_dataset.logs.dataset_id
}

output "log_sink_name" {
  description = "Name of the log sink"
  value       = google_logging_project_sink.bigquery_sink.name
}

output "alert_policy_id" {
  description = "ID of the CPU alert policy"
  value       = google_monitoring_alert_policy.cpu_alert.id
}

output "dashboard_id" {
  description = "ID of the monitoring dashboard"
  value       = google_monitoring_dashboard.main_dashboard.id
} 