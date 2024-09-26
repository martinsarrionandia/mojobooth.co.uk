data "aws_ebs_volume" "wordpress_root" {
  most_recent = true

  filter {
    name   = "volume-type"
    values = ["gp3"]
  }

  filter {
    name   = "tag:Name"
    values = ["rancher-mojobooth-wordpress-root"]
  }
}

data "aws_ebs_volume" "wordpress_maria" {
  most_recent = true

  filter {
    name   = "volume-type"
    values = ["gp3"]
  }

  filter {
    name   = "tag:Name"
    values = ["rancher-mojobooth-wordpress-maria"]
  }
}

resource "kubernetes_persistent_volume" "wordpress_root" {
  metadata {
    name = "mojobooth-wordpress-root"
    labels = {
      type = "amazonEBS"
    }
  }
  spec {
    storage_class_name = data.terraform_remote_state.rancher-config.outputs.amazon-ebs-class
    capacity = {
      storage = "1Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      aws_elastic_block_store {
        volume_id = data.aws_ebs_volume.wordpress_root.id
        fs_type   = "ext4"
      }
    }
  }

}

resource "kubernetes_persistent_volume_claim" "wordpress_root" {
  metadata {
    name      = "mojobooth-wordpress-root-claim"
    namespace = kubernetes_namespace.mojobooth.metadata.0.name
  }
  spec {
    storage_class_name = data.terraform_remote_state.rancher-config.outputs.amazon-ebs-class
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.wordpress_root.metadata.0.name
  }
}


resource "kubernetes_persistent_volume" "wordpress_maria" {
  metadata {
    name = "mojobooth-wordpress-maria"
    labels = {
      type = "amazonEBS"
    }
  }
  spec {
    storage_class_name = data.terraform_remote_state.rancher-config.outputs.amazon-ebs-class
    capacity = {
      storage = "1Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      aws_elastic_block_store {
        volume_id = data.aws_ebs_volume.wordpress_maria.id
        fs_type   = "ext4"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "wordpress_maria" {
  metadata {
    name      = "mojobooth-wordpress-maria-claim"
    namespace = kubernetes_namespace.mojobooth.metadata.0.name
  }
  spec {
    storage_class_name = data.terraform_remote_state.rancher-config.outputs.amazon-ebs-class
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
    volume_name = kubernetes_persistent_volume.wordpress_maria.metadata.0.name
  }
}