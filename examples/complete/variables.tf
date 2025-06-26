variable "region" {
  type        = string
  description = "AWS region"
}

variable "enabled_standards" {
  description = "A list of standards to enable in the account"
  type        = list(string)
  default     = []
}

variable "create_sns_topic" {
  description = "Flag to indicate whether an SNS topic should be created for notifications."
  type        = bool
  default     = false
}

variable "namespace" {
  description = "Globally unique namespace, i.e. short company name. Used by Security Hub"
  type        = string
}

variable "enable_security_hub" {
  description = "Enable Security Hub"
  type        = bool
  default     = true
}

variable "control_finding_generator" {
  description = <<-DOC
  Updates whether the calling account has consolidated control findings turned on.

  The possible values are:
    - `SECURITY_CONTROL` - Security Hub generates a singles finding for a control check even when the check applies to multiple enabled standards
    - `STANDARD_CONTROL` - Security Hub generates separate findings for a control check when the check applies to multiple enabled standards
  DOC
  type        = string
  default     = "STANDARD_CONTROL"

  validation {
    condition     = contains(["SECURITY_CONTROL", "STANDARD_CONTROL"], var.control_finding_generator)
    error_message = "The control_finding_generator value must be either 'SECURITY_CONTROL' or 'STANDARD_CONTROL'."
  }
}

variable "env" {
  description = "Env Name"
  type        = string
  default     = "prd"

  validation {
    condition     = contains(["sbx", "dev", "stg", "prd"], var.env)
    error_message = "Invalid environment. Allowed values are: dev, qa, stg, prd."
  }
}
