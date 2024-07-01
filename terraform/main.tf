terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
      version = ">= 1.58.1"
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = var.region
}

resource "ibm_resource_group" "es_kibana_resource_group" {
  name = "es_kibana_resource_group"
}