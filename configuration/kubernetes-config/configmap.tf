resource "kubernetes_config_map" "cm-mongodb" {
  metadata {
    name = "cm-mongodb"
    
  }

  // improve creds with secret
  data = {
    database_url = "mongodb-service"
  }
}
