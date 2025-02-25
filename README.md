# A Bash Script to Automatically Flush Pihole DNS Logs.

## Preface
This is the first script I have ever written, let alone the first time I have ever used GitHub to create and maintain a public repository. Therefore, I believe that this makes for a good learning experience! 

I don't see this repository getting much, if any, traffic; but, if it does, please feel free to make any suggestions or pull requests 
(at the time of writing this I have not really looked into how pull requests work, as I currently understand them - they are basically someone requesting me to make an edit). 

I was watching Learn Linux TV's [Bash Scripting on Linux](https://youtube.com/playlist?list=PLT98CRl2KxKGj-VKtApD8-zCqSaN2mD4w&si=Gy6WvNsFH4dqzTpC) Youtube series and it 
inspired me to write this script because it would automate a task I find myself frequently doing. I run Pi-hole on a Rasberry Pi 5 and I only have a 32Gb micro SD card for storage and I didn't want my storage being filled up by Pi-hole DNS Logs.

## Overview
This is a Bash script I wrote to flush the DNS Logs of my Pi-hole through an API request. It "automatically" runs as a cronjob set for everyday at 12:00 AM. In version 6, Pi-hole changed how the API operates. There is no longer a standard static API key for Pi-hole in version 6 with the implementation of REST. Now, performing API actions requires an authenticated session for which the corresponding "sid" must be included in the API url header.

This repository contains two scripts: *get_api_sid.sh* and *piholeFlush.sh*. The *get_api_sid.sh* script is to be ran once to retrieve an authenticated sid for a valid API session. In the Pi-hole web interface under "Settings" > "Web interface / API," you will see a list of running, valid, API sessions. This list has a column titled "ID" where it displays a simple number (e.g. 0, 1, 2, etc.), however, this is not the session's sid. The sid is returned as a JSON object to API calls through REST API; in other words, it is a little tricky to obtain this string. That's where my *get_api_sid.sh* script comes in to play. Running this script will print your sid string as standard output to your command line. From here, you will then copy the sid and paste it into the *piholeFlush.sh* script to allow it to make authenticated API requests to flush your DNS logs.

### Why would I use this script?
I wrote this script because as of right now, I do not need Pi-hole's DNS logs any more than the last 24-hours. Therefore, the DNS logs simply take up space on my disk (I know it's not taking up Gigabytes, but still, they are taking up disk space). I have been manually flushing my DNS logs whenever I could remember to do so, and I would often forget. That is why I wrote this script, so that I could make sure my DNS logs are automatically flushed every 24 hours and prevent a build-up of unnecessary, outdated, DNS logs.

## Usage
### Prerequisites
#### Pi-hole Web interface configuration
#### Packages
The following is a list of packages used in the scripts that should be installed on your system:
* curl
* grep
* awk
* sed
### *get_api_sid.sh*
### *piholeFlush.sh*