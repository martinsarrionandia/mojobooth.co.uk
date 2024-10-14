resource "kubernetes_namespace" "mojobooth" {
  metadata {
    name = "mojobooth-wordpress"
  }
}