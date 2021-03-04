resource "kubernetes_service" "app" {
  metadata {
    name = "api-service"
  }
  spec {
    selector = {
      app = var.app
    }
    port {
      port        = 5000
      target_port = 5000
    }
  }
}

resource "kubernetes_service" "dbservice" {
  metadata {
    name = "mongodb-service"
  }
  spec {
    selector = {
      app = "mongodb"
    }
    port {
      protocol = "TCP"
      port = 27017
      target_port = 27017
    }
    
    
  }
} 
