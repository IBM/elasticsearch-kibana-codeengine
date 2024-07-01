# The data object below calls the ES URL in order to establish the full version of the deployed database
# because that is needed to deploy Kibana.
# The full version gets stored in a local variable es-full-version and then used in the codengine resources

data "http" "es_metadata" {
  url=  "https://${var.es_username}:${var.es_password}@${var.es_host}:${var.es_port}"
 insecure = true
}

locals {
    # get data from api call
    es_data = jsondecode(data.http.es_metadata.response_body)

    # get version
    es-full-version = local.es_data.version.number
}
