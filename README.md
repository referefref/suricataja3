# suricataja3
Create a simple suricata rule blocking on ja3 hash from pcap

# Requires
https://github.com/salesforce/ja3

# How to use it?
* Simply run suricataj3hash.sh PCAP.pcap and it will create a rule file with SID 13371337 if a hash is found.
* You should limit your PCAP to just the malware sample as this will only deal with one ja3 hash

# Todo
* Take input from user to choose which hash to use, or create multiple rules
* Take input from user to specify fields such as message, SID, etc.
