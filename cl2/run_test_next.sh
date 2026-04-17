for i in {1..10}
do
	echo "Spúšťam test číslo: $i"
	./clusterloader2 --kubeconfig=$KUBECONFIG --testconfig=./cl2_config.yaml --provider=skeleton --enable-prometheus-server=true --tear-down-prometheus-server=false --v=6 --report-dir=./reports
done
