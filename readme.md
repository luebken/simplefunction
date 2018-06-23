
# Deployment

* Make sure you the right region is configured:  `aws configure` and configure the Lambdas accordingly

* Create SNS Topic 'simplefunction' add ARN to simplefunction-c
  https://us-west-1.console.aws.amazon.com/sns/v2/home?region=us-west-1#/newuser

* Create DynamoDB table: simplefunction & name
  https://us-west-1.console.aws.amazon.com/dynamodb/

* `make lambda-create`

* Add API-Gateway trigger for lambdas: simplefunction-a & simplefunction-c
* Add SNS trigger for simplefunction-d: 
  https://us-west-1.console.aws.amazon.com/lambda/home?region=us-west-1#/functions

* Get URL https://us-west-1.console.aws.amazon.com/apigateway/home?region=us-west-1#/apis


# Overview

    [/simplefunction-a](simplefunction-a/index.js)  -> [/simplefunction-b](simplefunction-b/index.js)
    [/simplefunction-c](simplefunction-c/index.js)  -> SNS -> [/simplefunction-d](simplefunction-d/index.js)
                                                    -> DynamoDB

# Links:

https://docs.aws.amazon.com/cli/latest/reference/lambda/
https://docs.aws.amazon.com/xray-sdk-for-nodejs/latest/reference/index.html
https://blog.atj.me/2017/10/bundle-lambda-functions-using-webpack/

https://0ssjn36km5.execute-api.us-west-1.amazonaws.com/prod/simplefunction-a

