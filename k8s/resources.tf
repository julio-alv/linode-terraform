
resource "kubernetes_deployment" "web" {
  depends_on = [var.cluster, var.sleep]

  metadata {
    name = "web"
    labels = {
      app = "web"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "web"
      }
    }

    template {
      metadata {
        labels = {
          app = "web"
        }
      }

      spec {
        container {
          image             = "ghcr.io/julio-alv/web:latest"
          name              = "web"
          image_pull_policy = "Always" # Explicitly set to Always

          resources {
            limits = {
              cpu    = "0.5"
              memory = "768Mi"
            }
            requests = {
              cpu    = "0.25"
              memory = "512Mi"
            }
          }

          port {
            container_port = 3000
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 3000

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "srv" {
  depends_on = [kubernetes_deployment.web]
  metadata {
    name = "srv"
  }

  spec {
    type = "LoadBalancer"
    selector = {
      app = kubernetes_deployment.web.metadata[0].labels.app
    }

    port {
      port        = 80
      target_port = 3000
      protocol    = "TCP"
    }
  }
}
