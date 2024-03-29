resource "aws_budgets_budget" "monthly-budget" {
  name              = "CloudX-monthly-budget"
  budget_type       = "COST"
  limit_amount      = "15"
  limit_unit        = "USD"
  time_period_start = "2023-07-07_00:00"
  time_period_end   = "2030-07-07_00:00"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 40
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = [var.aws_email_alert]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = [var.aws_email_alert]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = [var.aws_email_alert]
  }
}
