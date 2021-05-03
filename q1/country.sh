#!/bin/bash

# Pass the path to access logfile as the only argument
awk ' { print $1 } ' ${1} | xargs -I{} -n1 sh -c "whois {} | grep country -i -m 1 | cut -d ':' -f 2 | xargs" | sort | uniq -c | sort -n | tail -1
