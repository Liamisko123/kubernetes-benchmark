./clusterloader2 --kubeconfig=$KUBECONFIG --testconfig=examples/generic_query_example.yaml --provider=skeleton --enable-prometheus-server=true --tear-down-prometheus-server=false --prometheus-pvc-storage-class="microk8s-hostpath" --prometheus-storage-class-provisioner="microk8s.io/hostpath" --prometheus-ready-timeout=15m --prometheus-memory-request="256M" --v=2

kubectl apply -f nodeexporter_config.yaml
kubectl patch endpoints master -n monitoring --type='json' -p='[{"op": "replace", "path": "/subsets/0/ports/0/port", "value": 16443}]'