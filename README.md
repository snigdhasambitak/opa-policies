# OPA on Kubernetes: Security policies

helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
helm install gatekeeper/gatekeeper --name-template=gatekeeper --namespace gatekeeper-system --create-namespace

kubectl get all -n gatekeeper-system


## required labels
k create -f constraint-template-labels.yaml

k apply -f constraint-instance-ns.yaml

k apply -f example_allowed_ns.yaml

k apply -f example_disallowed_ns.yaml

## priviledged containers

k apply -f constraint-template-priviledged.yaml

k apply -f constraint-instance-priviledge

k apply -f example_allowed_pod.yaml

k apply -f example_disallowed_pod.yaml

## allowed repos

k apply -f constraint-template-repos.yaml

k apply -f constraint-allowed-repo.yaml

k apply -f example_allowed_repo.yaml

k apply -f example_disallowed_repo.yaml


## terraform example

terraform init

terraform plan --out planfile

terraform show -json planfile > plan.json

opa eval data.policy.all_policies -d infra-policies/ -i plan.json -f pretty