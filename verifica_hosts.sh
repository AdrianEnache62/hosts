#!/bin/bash
cat /etc/hosts | while read ip  nume restul; do
	if [ -z "$ip" ] || [ "$ip" == \#* ]] || [ "$nume" = "localhost" ]; then
		continue
	fi
	rezultat=$(nslookup "$nume" 2>/dev/null)
	if ! echo "$rezultat" | grep -q "$ip"; then
		echo "Bogus IP for $nume in /etc/hosts!"
	fi
done
