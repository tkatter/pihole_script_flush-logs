#! /bin/bash

## This script was built around Pi-hole version 6

###############
## VARIABLES ##
###############

## Pihole API URL variables
###########################
## Insert either your Pi-hole's webserver domain or its local IPv4 address.
# Example: server=pi.hole or server=192.168.1.100
server=<YOUR_PIHOLE_DOMAIN_OR_IPV4>

## Insert the port number that your Pi-hole is accessed through.
# Example: port=80
port=<PORT>

## Log variables
################
logFile=/var/log/piholeFlushScript.log # Log file for all of the standard output from the curl command run by this script.
errorsLog=/var/log/piholeFlushScript_errors.log # Log file for all of the ____ output from the curl command run by this script.

############
## SCRIPT ##
############

## Curl command to flush the Pihole DNS logs via API
## If using https update the curl url from http to https
## Insert your sid
# Example: -H 'sid: nApcz/rhE8lMWnfrTfirGw='
$(which curl) -X POST "http://$server:$port/api/action/flush/logs" \
 -H 'accept: application/json'\
 -H 'sid: <YOUR_SID>'\
 1>>$logFile\
 2>>$errorsLog

$(which echo) "This was ran at $(date)." 1>>$logFile
$(which echo) "This was ran at $(date)." 1>>$errorsLog