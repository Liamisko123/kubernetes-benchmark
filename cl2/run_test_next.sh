#!/bin/bash
for i in {1..100}
do
	echo "Spúšťam test číslo: $i" | tee -a runno.txt
	./clusterloader2 --kubeconfig=$KUBECONFIG --testconfig=./cl2_config.yaml --provider=skeleton --enable-prometheus-server=true --tear-down-prometheus-server=false --v=6 --report-dir=./reports
done

# spusti z konzole: nohup ./run_test_next.sh >log_long.txt 2>&1 &
