resource "kubernetes_deployment" "app" {
  metadata {
    name = "app-deployment"
    labels = {
      app = var.app
    }
  }
  spec {
    replicas = 2

    selector {
      match_labels = {
        app = var.app
      }
    }
    template {
      metadata {
        labels = {
          app = var.app
        }
      }
      spec {
        container {
          image = var.docker-image
          name  = var.app
          port {
            name           = "port-5000"
            container_port = 5000
          }
          env {
            name = "DATABASE_USER"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.db_credentials.metadata[0].name
                key  = "username"
              }
            }
          }
          env {
            name = "DATABASE_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.db_credentials.metadata[0].name
                key  = "password"

              }
            }
          }
          env {
            name = "DATABASE"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.db_credentials.metadata[0].name
                key  = "database"

              }
            }
          }
          env {
            name  = "DATABASE_SERVER"
            value = "mongodb-service"
          }
          env{
            name = "DATABASE_PORT"
            value = var.mongo_db_port
          }

        }
      }
    }
  }
}

resource "kubernetes_deployment" "database" {
  metadata {
    name = var.db
    labels = {
      app = "mongodb"
    }
  }
  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mongodb"
      }
    }
    template {
      metadata {
        labels = {
          app = "mongodb"
        }
      }
      spec {
        container {
          image = var.db-image
          name  = "mongodb"
          port {
            name           = "port-27017"
            container_port = 27017
          }

          env {
            name = "MONGO_INITDB_ROOT_USERNAME"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.db_credentials.metadata[0].name
                key  = "username"
              }
            }
          }
          env {
            name = "MONGO_INITDB_ROOT_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.db_credentials.metadata[0].name
                key  = "password"
              }
            }
          }

         env {
            name = "MONGO_INITDB_DATABASE"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.db_credentials.metadata[0].name
                key  = "database"
              }
            }
          }

        }
      }
    }
  }


}
