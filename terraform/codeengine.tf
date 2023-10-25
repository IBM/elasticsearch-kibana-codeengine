resource "ibm_code_engine_project" "kibana_code_engine" {
  name              = "kibana-code-engine-project"
}


resource "ibm_code_engine_app" "kibana_app" {
  project_id      = ibm_code_engine_project.kibana_code_engine.project_id
  name            = "kibana-app"
  image_reference = "docker.elastic.co/kibana/kibana:${var.es_version}"
  image_port = 5601

  run_env_variables {
    type  = "literal"
    name  = "ELASTICSEARCH_HOSTS"
    value = "[\"${var.es_url}\"]"
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