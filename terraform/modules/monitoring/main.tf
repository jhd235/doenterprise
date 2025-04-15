# Create a monitoring workspace
resource "google_monitoring_workspace" "workspace" {
  display_name = var.workspace_name
  project      = var.project_id
}

# Create a logging sink to export logs to BigQuery
resource "google_logging_project_sink" "bigquery_sink" {
  name        = var.log_sink_name
  destination = "bigquery.googleapis.com/projects/${var.project_id}/datasets/${google_bigquery_dataset.logs.dataset_id}"
  filter      = var.log_filter
  project     = var.project_id

  bigquery_options {
    use_partitioned_tables = true
  }
}

# Create BigQuery dataset for logs
resource "google_bigquery_dataset" "logs" {
  dataset_id    = var.bigquery_dataset_id
  friendly_name = "Logs Dataset"
  description   = "Dataset for storing exported logs"
  location      = var.location
  project       = var.project_id

  default_table_expiration_ms = var.table_expiration_ms
}

# Create alerting policy for high CPU usage
resource "google_monitoring_alert_policy" "cpu_alert" {
  display_name = "High CPU Usage Alert"
  combiner     = "OR"
  project      = var.project_id

  conditions {
    display_name = "CPU Usage > 80%"

    condition_threshold {
      filter          = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\""
      duration        = "300s"
      comparison      = "COMPARISON_GT"
      threshold_value = 0.8

      aggregations {
        alignment_period   = "300s"
        per_series_aligner = "ALIGN_MEAN"
      }
    }
  }

  notification_channels = [google_monitoring_notification_channel.email.id]
}

# Create notification channel for email alerts
resource "google_monitoring_notification_channel" "email" {
  display_name = "Email Alerts"
  type         = "email"
  project      = var.project_id

  labels = {
    email_address = var.alert_email
  }
}

# Create dashboard for monitoring
resource "google_monitoring_dashboard" "main_dashboard" {
  dashboard_json = jsonencode({
    displayName = "Main Monitoring Dashboard"
    gridLayout = {
      columns = 2
      widgets = [
        {
          title = "CPU Usage"
          xyChart = {
            dataSets = [{
              timeSeriesQuery = {
                timeSeriesFilter = {
                  filter = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\""
                  aggregation = {
                    perSeriesAligner = "ALIGN_MEAN"
                  }
                }
              }
              plotType = "LINE"
            }]
          }
        },
        {
          title = "Memory Usage"
          xyChart = {
            dataSets = [{
              timeSeriesQuery = {
                timeSeriesFilter = {
                  filter = "metric.type=\"agent.googleapis.com/memory/percent_used\""
                  aggregation = {
                    perSeriesAligner = "ALIGN_MEAN"
                  }
                }
              }
              plotType = "LINE"
            }]
          }
        }
      ]
    }
  })
  project = var.project_id
} 