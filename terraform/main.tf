module "eks" {
  source = "./modules/EKS"
}

module "ec2" {
  source           = "./modules/EC2"
  vpc_id           = module.eks.vpc
  public_subnet_id = module.eks.subnet
  script = "script.sh"
  worker = module.eks.worker

}

module "ecr" {
  source = "./modules/ECR"
}


