function(prod=false) {                    
   "apiVersion": "apps/v1",
   "kind": "Deployment",
   "metadata": {
      "name": "hola",
      "namespace: "hola-web"
   },
   "spec": {
      "selector": {
         "matchLabels": {
            "app": $.metadata.name      
         }
      },
      "replicas": if prod then 10 else 1, 
      "template": {
         "metadata": {
            "labels": {
               "app": $.metadata.name
            }
         },
         "spec": {
            "containers": [
               {
                  "name": $.metadata.name,
                  "image": "dther/web-app-flux:v0.4",
                  "ports": [
                     {
                        "containerPort": 8080
                     }
                  ]
               }
            ]
         }
      }
   }
}
