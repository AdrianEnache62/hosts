#!/bin/bash

verificara_ip() {
	local nume=$1
	local ip_asteptat=$2
	local server_dns=$3

	rezultat=$(nslookup "$nume" "$server_dns" 2>/dev/NULL)

	if ! echo "$rezultat" | grep -q "$ip_asteptat"; then
		echo "Bogus IP for $nume in /etc/hosts!"
	fi
}

cat /etc/hosts | while read ip nume restul; do
	if [ -z "$ip" ] || [[ "$ip" == \#* ]] || [ "$nume" = "localhost" ]; then
		continue
	fi

	verifica_ip "$nume" "$ip" "8.8.8.8"
