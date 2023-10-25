# elasticsearch-kibana-codeengine
Deploy Kibana using IBM Code Engine and connect to your IBM Cloud Databases for Elasticsearch instance.

Using this repo you can deploy [Kibana](https://www.elastic.co/kibana) using [IBM Code Engine](https://www.ibm.com/products/code-engine) and connect to your [IBM Cloud Databases for Elasticsearch](https://www.ibm.com/products/databases-for-elasticsearch) instance.

Kibana is a web interface that allows you to visualise the data in Elasticsearch instances. 
IBM Code Engine is a a fully managed, serverless platform that allows you to run workloads without worrying about deploying infrastructure.
Elasticsearch is a NoSQL database with powerful search capabilities.

The IBM Elasticsearch service does not include a managed Kibana service, but following this tutorial you can have a Kibana instance up and running and connected to your Elasticsearch database within a few minutes and still using the managed service model of the IBM Cloud.

> NOTE: Code Engine is a [paid-for service](https://cloud.ibm.com/docs/codeengine?topic=codeengine-pricing), so following this tutorial will incur charges.

## Pre-requisites

- An [IBM Cloud Account](https://cloud.ibm.com/registration).
- [Terraform](https://www.terraform.io/) - to deploy infrastructure
- A pre-existing [IBM Cloud Databases for Elasticsearch deployment](https://cloud.ibm.com/databases/databases-for-elasticsearch/create)



## Step 1: Obtain an API key to deploy infrastructure to your account


Follow [these steps](https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui#create_user_key) to create an IBM Cloud API key that enables Terraform to provision infrastructure into your account. You can create up to 20 API keys.

For security reasons, the API key is only available to be copied or downloaded at the time of creation. If the API key is lost, you must create a new API key.

## Step 2: Clone the project

```sh

git clone https://github.com/IBM/elasticsearch-kibana-codeengine.git

```

## Step 3: Install the infrastructure

1. Navigate into the `terraform` folder of the cloned project.

1. On your machine, create a document that is named `terraform.tfvars`, with the following fields:

   ```sh

    ibmcloud_api_key = "<your_api_key_from_step_1>"
    region = "<your_region>"
    es_url = "<the url of your elasticsearch deployment>"
    es_username = "<the username of your elasticsearch deployment>"
    es_password = "<the password of your elasticsearch user>"
    es_version="<the version of your elasticsearch deployment>"

   ```

   The `terraform.tfvars` document contains variables that you might want to keep secret so it is ignored by the GitHub repository.

1. Install the infrastructure with the following command:

   ```sh
   terraform init 
   terraform apply --auto-approve
   ```

## Step 4: Visit your Kibana deployment

The previous step will produce a URL, which is the public URL of your Kibana deployment. It will look something like: `https://kibana-app.1834dcfgrtygbg.eu-gb.codeengine.appdomain.cloud`. 

If you visit that URL in your web browser you should see the Kiban login screen where you can log in with your credentials and have access to your Elasticsearch deployment!