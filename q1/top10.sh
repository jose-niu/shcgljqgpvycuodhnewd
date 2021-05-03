#!/bin/bash

# Pass the path to access logfile as the only argument
awk -vDate=`date -d '10 Jun 2019 00:00:00' +[%d/%b/%Y:%H:%M:%S` -vDate2=`date -d '19 Jun 2019 23:59:59' +[%d/%b/%Y:%H:%M:%S` ' { if ($4 >= Date && $4 <= Date2) print $1 } ' ${1} | sort | uniq -c | sort -n | tail -10 | tac
