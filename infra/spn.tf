
# data "azuread_client_config" "current" {}


# resource "azuread_application" "example" {
#   display_name     = "${local.app_name}-${local.env}-spn"
#   owners       = [data.azuread_client_config.current.object_id]
# }

# resource "azuread_service_principal" "example" {
#   application_id = azuread_application.example.application_id
# }

# resource "azuread_service_principal_password" "example" {
#   service_principal_id = azuread_service_principal.example.id
#   end_date             = "2025-01-01T01:02:03Z"
# }


# resource "azuread_service_principal_certificate" "example" {
#   service_principal_id = azuread_service_principal.example.id
#   type                 = "AsymmetricX509Cert"
#   value                = file("cert.pem")
#   end_date             = "2021-05-01T01:02:03Z"
# }