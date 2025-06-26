provider "aws" {
  region = var.region
}

module "example" {
  source = "../.."

  control_finding_generator       = var.control_finding_generator #Must be set before delegation
  create_sns_topic                = var.create_sns_topic
  delegation_account_id           = "0123456789"
  enable_default_standards        = false
  enabled                         = var.enable_security_hub ? true : false
  enabled_standards               = var.enabled_standards
  environment                     = var.env
  finding_aggregator_enabled      = false # Disabled due to delegation
  finding_aggregator_linking_mode = "ALL_REGIONS"
  namespace                       = var.namespace
}
