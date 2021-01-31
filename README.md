# k8s_infra_module
Terraform module for k8s infra on AWS

Criar o modulo root no computador para chamar os modules no git

```
provider "aws" {
  region        = "sa-east-1"
}

module "infra" {
    source       = "git@github.com:lipenodias/k8s_infra_module.git"
    nome_no      = ["LoadBalancer","Master1","Master2","Master3","Worker 1","Worker 2","Worker 3"]
}

terraform {
    backend "s3" {
       bucket   = "descomplicando-terraform-felipedias"
       key      = "terraform-test.tfstate"
       region   = "sa-east-1"
       encrypt  = true
    }
}

```
