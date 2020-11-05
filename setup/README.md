# Kind and ingress Setup

```
$ kind create cluster --config multi.yaml
$ kubectl create -f deploy.yaml
$ kubectl -n ingress-nginx rollout status deployment/ingress-nginx-controller
```

# Setup Hosts

`/etc/hosts`
```
127.0.0.1 hola.opslab.local
127.0.0.1 hola-qa.opslab.local
127.0.0.1 argocd.opslab.local
127.0.0.1 sockshop.opslab.local
```

# Install Tools

```
$ brew install kustomize
$ brew install conftest
$ brew install kubeval
$ brew install fluxctl
$ brew install argocd
```

# Commands for fluxcd

```
$ kubectl create namespace flux
$ export GHUSER=DTherHtun
$ fluxctl install --git-user=${GHUSER} --git-email=${GHUSER}@users.noreply.github.com --git-url=git@github.com:${GHUSER}/repo --git-path=namespaces,workloads --namespace=flux | kubectl apply -f -
$ kubectl -n flux rollout status deployment/flux
$ fluxctl identity --k8s-fwd-ns flux
$ fluxctl sync --k8s-fwd-ns flux
$ fluxctl list-workloads -A
$ fluxctl list-images
```

# Setup ArgoCD

```
$ kubectl create namespace argocd
$ kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
$ kubectl create -f argocd-ingress.yaml
```
