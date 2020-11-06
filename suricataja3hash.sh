#!/bin/bash
# requires ja3 https://github.com/salesforce/ja3

if [ "$#" -eq 1 ]; then
	# get ja3 hash
	ja3=$(ja3 --json ${1} | grep ja3 | tail -n 1 | awk -F ":" '{print $2}' | sed -e 's/"//g; s/,//g; s/ //g')
	if [ ! -z "$ja3" ]; then
		# set variables
		date=$(date +%Y_%d_%m)
		fileBase=$(echo $1 | awk -F "." '{print $1}')
		filename=$(echo "${fileBase}.rule")
		# generate rule
		echo 'alert tls $HOME_NET any -> $EXTERNAL_NET any (msg: "ET TROJAN' ${fileBase} 'SSL Connection"; ja3_hash; content:"'${ja3}'"; classtype: trojan-activity; metadata: affected_product Windows_XP_Vista_7_8_10_Server_32_64_Bit, attack_target Client_Endpoint, deployment Perimeter, signature_severity Major, created_at '${date}', performance_impact Low, updated_at '${date}'; sid: 13371337; rev: 1;)' > $filename
		echo "Rule created at: ${filename}"
	else
		echo "No ja3 hash found in ${1}"
	fi
else
	echo "Usage: suricataja3hash.sh path/to/pcap.pcap"
fi
