data "aws_eks_cluster" "demo_eks" {
  name = aws_eks_cluster.demo_eks.name
}

data "aws_eks_cluster_auth" "demo_eks" {
  name = aws_eks_cluster.demo_eks.name
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.demo_eks.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.demo_eks.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.demo_eks.token
  }
}