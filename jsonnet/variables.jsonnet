local name = "hola";
local version = "v0.4";
local replicas = 2;
{
   "apiVersion": "apps/v1",
   "kind": "Deployment",
   "metadata": {
      "name": name
   },
   "spec": {
      "selector": {
         "matchLabels": {
            "app": name
         }
      },
      "replicas": replicas,
      "template": {
         "metadata": {
            "labels": {
               "app": name
            }
         },
         "spec": {
            "containers": [
               {
                  "name": name,
                  "image": "dther/web-app-flux:" + version,
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
