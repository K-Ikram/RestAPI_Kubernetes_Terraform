resource "kubernetes_secret" "db_credentials" {
  metadata {
    name = "mongodb-secrets"
    
  }
  data = {
    username = "cm9vdA=="
    password = "bXlkYg=="
		database = "nodejsdemo"
  
  }
  type = "opaque"
}

