provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"  # Adjust the path to your kubeconfig file
  }
}

resource "helm_release" "my_rust_microservice" {
  name       = "my-rust-microservice"
  chart      = "./path/to/my-rust-microservice-chart-0.1.0.tgz"  # Adjust the path to your Helm chart tarball
  namespace  = "default"  # Adjust the namespace as needed
  version    = "0.1.0"    # Adjust the Helm chart version

  set {
    name  = "replicaCount"
    value = "1"
  }

  set {
    name  = "image.repository"
    value = "your-docker-registry/your-rust-image"
  }

  set {
    name  = "image.tag"
    value = "latest"
  }

  set {
    name  = "service.name"
    value = "my-rust-microservice"
  }

  set {
    name  = "service.port"
    value = "8080"
  }
}
