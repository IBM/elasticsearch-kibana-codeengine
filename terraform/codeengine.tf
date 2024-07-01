resource "ibm_code_engine_project" "kibana_code_engine" {
  name              = "kibana-code-engine-project2"
  resource_group_id = ibm_resource_group.es_kibana_resource_group.id

}


resource "ibm_code_engine_app" "kibana_app" {
  project_id      = ibm_code_engine_project.kibana_code_engine.project_id
  name            = "kibana-app"
  image_reference = "docker.elastic.co/kibana/kibana:${local.es-full-version}"
  image_port = 5601
  scale_min_instances = 1
  scale_max_instances = 1

  run_env_variables {
    type  = "literal"
    name  = "ELASTICSEARCH_HOSTS"
    value = "[\"https://${var.es_host}:${var.es_port}\"]"
  }
    run_env_variables {
    type  = "literal"
    name  = "ELASTICSEARCH_USERNAME"
    value = var.es_username
  }
   run_env_variables {
    type  = "literal"
    name  = "ELASTICSEARCH_PASSWORD"
    value = var.es_password
  }
run_env_variables {
    type  = "literal"
    name  = "ELASTICSEARCH_SSL_ENABLED"
    value = "true"
  }

run_env_variables {
    type  = "literal"
    name  = "SERVER_HOST"
    value = "0.0.0.0"
  }

run_env_variables {
    type  = "literal"
    name  = "ELASTICSEARCH_SSL_VERIFICATIONMODE"
    value = "none"
  }
  
}

output "endpoint" {

value=ibm_code_engine_app.kibana_app.endpoint
  
}