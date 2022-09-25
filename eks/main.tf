module "eks" {
    source = "terraform-aws-modules/eks/aws"

    cluster_name = "joybox"
    cluster_version                 = "1.22"
    cluster_endpoint_private_access = false
    cluster_endpoint_public_access  = true

    # vpc 를 destroy 하고 다시 만든 경우
    # 아래의 변수들을 업데이트 해줘야 한다
    vpc_id = "vpc-05eeea3080049eef3"
    subnet_ids = [ "subnet-069c612c7fa91ae9c", "subnet-058b253ed92a4a00e"]

    eks_managed_node_groups = {
        default_node_group = {
            min_size     = 2
            max_size     = 3
            desired_size = 2
            instance_types = ["t2.medium"]
        }
    }

    tags = {
        Environment = "dev"
    }
}