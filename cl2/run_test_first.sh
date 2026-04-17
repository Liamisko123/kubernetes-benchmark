./clusterloader2 --kubeconfig=$KUBECONFIG --testconfig=./cl2_config.yaml --provider=skeleton --enable-prometheus-server=true --tear-down-prometheus-server=false --prometheus-pvc-storage-class="local-path" --prometheus-storage-class-provisioner="rancher.io/local-path" --prometheus-ready-timeout=15m --prometheus-memory-request="256M" --v=2

kubectl apply -f nodeexporter_config.yaml

kubectl apply -f nodeexporter_config.yaml
kubectl patch endpoints master -n monitoring --type='json' -p='[{"op": "replace", "path": "/subsets/0/ports/0/port", "value": 16443}]'