# A Bash Script to Automatically Flush Pihole DNS Logs.

## Preface
This is the first script I have ever written, let alone the first time I have ever used GitHub to create and maintain a public repository. Therefore, I believe that this makes for a good learning experience! 

I don't see this repository getting much, if any, traffic; but, if it does, please feel free to make any suggestions or pull requests 
(at the time of writing this I have not really looked into how pull requests work, as I currently understand them - they are basically someone requesting me to make an edit). 

I was watching Learn Linux TV's [Bash Scripting on Linux](https://youtube.com/playlist?list=PLT98CRl2KxKGj-VKtApD8-zCqSaN2mD4w&si=Gy6WvNsFH4dqzTpC) Youtube series and it 
inspired me to write this script because it would automate a task I find myself frequently doing. I run Pi-hole on a Rasberry Pi 5 and I only have a 32Gb micro SD card for storage 
and I didn't want my storage being filled up by Pi-hole DNS Logs.
## Overview
A Bash script I wrote to automatically flush my PiHole logs via a cronjob for the sake of saving disk space on my RPi5.