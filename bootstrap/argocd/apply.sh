#!/bin/sh

kubectl taint nodes -l kubernetes.io/arch=arm64 arch=arm64:NoSchedule --overwrite

helm template \
    --include-crds \
    --namespace argocd \
    argocd . \
    | kubectl apply -n argocd -f -

kubectl -n argocd wait --timeout=60s --for condition=Established \
       crd/applications.argoproj.io \
       crd/applicationsets.argoproj.io
