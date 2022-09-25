module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.4"                        

  name = "vpc"                              
  cidr = "10.0.0.0/16"                      

  azs             = ["ap-northeast-2a", "ap-northeast-2c"] 
  public_subnets  = ["10.0.0.0/24", "10.0.1.0/24"]  
  private_subnets = ["10.0.10.0/24", "10.0.11.0/24"] 
 
  enable_nat_gateway = true			
  single_nat_gateway = true         
  one_nat_gateway_per_az = false    
  
  enable_dns_hostnames = "true"
  enable_dns_support    = "true"

  tags = { "TerraformManaged" = "true" }
}