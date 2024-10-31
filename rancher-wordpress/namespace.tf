resource "kubernetes_namespace" "mojobooth" {
  metadata {
    name = "mojobooth-wordpress"
    labels = {
        "pod-security.kubernetes.io/enforce"="privileged"
        "pod-security.kubernetes.io/audit"="baseline"
        "pod-security.kubernetes.io/warn"="baseline"
    }
  }
}