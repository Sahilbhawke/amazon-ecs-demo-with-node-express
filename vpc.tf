module "vpc" {
  source         = "terraform-aws-modules/vpc/aws"
  version        = "2.38.0"
  name           = "app-deployment"
  cidr           = "10.0.0.0/16"
  azs            = ["us-east-2a", "us-east-2b"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  tags = {
    env          = "deployment/production"
    project_name = "node-calc-app"
    createdBy    = "bitcot-dev"
  }
}

data "aws_vpc" "main" {
  id = module.vpc.vpc_id
}