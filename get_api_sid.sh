#! /bin/bash

server=<YOUR_SERVER>
port=<PORT>
outputFile=./curl_output.txt

$(which curl) -k --dump-header $outputFile -X POST http://$server:$port/api/auth --data '{"password":"YOUR_PASSWORD"}' \
1>>/dev/null \
2>>/dev/null

$(which grep) sid $outputFile | $(which awk) -F';' '{print $1}' | $(which awk) '{print $2}'