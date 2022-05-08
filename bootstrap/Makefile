.POSIX:
.EXPORT_ALL_VARIABLES:

KUBECONFIG = $(shell pwd)/../metal/kubeconfig.yaml

default: taint namespace argocd root

argocd/charts: argocd/Chart.yaml
	cd argocd \
		&& helm dependency update

namespace:
	kubectl create namespace argocd --dry-run=client --output=yaml \
		| kubectl apply -f -

.PHONY: argocd
argocd: argocd/charts
	cd argocd && \
		./apply.sh

.PHONY: root
root:
	cd root && \
		./apply.sh

taint:
    kubectl taint nodes -l kubernetes.io/arch=arm64 arch=arm64:NoSchedule