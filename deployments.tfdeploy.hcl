// deployments.tfdeploy.hcl
identity_token "aws" {
  audience = ["terraform-stacks-private-preview"]
}

identity_token "hcp" {
  audience = ["hcp.workload.identity"]
}

identity_token "k8s" {
  audience = ["k8s.workload.identity"]
}

deployment "development-airnz" {
  variables = {
    aws_identity_token_file   = identity_token.aws.jwt_filename
    regions                   = ["ap-southeast-1"]
    role_arn                  = "arn:aws:iam::804453558652:role/tfstacks-role"
    vpc_name                  = "eks-vpc-dev2"
    vpc_cidr                  = "10.0.0.0/16"
    kubernetes_version        = "1.28"
    cluster_name              = "eks-cluster"
    manage_aws_auth_configmap = false
  }
}

  deployment "prod-airnz" {
    variables = {
      aws_identity_token_file = identity_token.aws.jwt_filename
      regions                 = [
        "ap-southeast-1"
      ]
      role_arn                  = "arn:aws:iam::804453558652:role/tfstacks-role"
      vpc_name                  = "eks-vpc-prod2"
      vpc_cidr                  = "10.0.0.0/16"
      kubernetes_version        = "1.28"
      cluster_name              = "eks-cluster"
      manage_aws_auth_configmap = false
    }
  }
