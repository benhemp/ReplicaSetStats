#!/bin/sh
# Known Issues: strips out the hours on anything measured in both days and hours. because I'm lazy.

#kubectl get rs --all-namespaces | awk {'print $3" "$4" "$5" "$6'} | grep d | grep -v h | tr -d \[:alpha:\] | awk {'print $1" "$2" "$3" "$4" days"'} | sort -k4,4 -n -r > /tmp/rsstats.txt
kubectl get rs --all-namespaces | awk {'print $3" "$4" "$5" "$6'} | grep d | cut -d "d" -f 1  | awk {'print $1" "$2" "$3" "$4" days"'} | sort -k4,4 -n -r > /tmp/rsstats.txt
kubectl get rs --all-namespaces | awk {'print $3" "$4" "$5" "$6'} | grep -v d | grep h | cut -d "h" -f 1  | awk {'print $1" "$2" "$3" "$4" hours"'} | sort -k4,4 -n -r >> /tmp/rsstats.txt
kubectl get rs --all-namespaces | awk {'print $3" "$4" "$5" "$6'} | grep -v h | grep -v d | cut -d "m" -f 1  | awk {'print $1" "$2" "$3" "$4" minutes"'} | sort -k4,4 -n -r >> /tmp/rsstats.txt

