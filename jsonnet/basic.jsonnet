
{
   // Look! It's JSON with comments!
   "apiVersion": "apps/v1",
   "kind": "Deployment",
   "metadata": {
      "name": "hola",
      "namespace": "hola-web"
   },
   "spec": {
      "selector": {
         "matchLabels": {
            "app": "hola"
         }
      },
      "replicas": 2,
      "template": {
         "metadata": {
            "labels": {
               "app": "hola"
            }
         },
         "spec": {
            "containers": [
               {
                  "name": "hola",
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
