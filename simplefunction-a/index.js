var xray = require('aws-xray-sdk-core');
var aws = xray.captureAWS(require('aws-sdk'));

var lambda = new aws.Lambda({
  region: 'us-west-1' //change to your region
});

exports.handler = (event, context, callback) => {
  lambda.invoke({
    FunctionName: 'simplefunction-b',
    //Payload: JSON.stringify(event, null, 2) // pass params
  }, function(error, data) {
    if (error) {
      context.done('error', error);
    }
    if (data.Payload) {
      callback(null, {
        'statusCode': '200',
        'body': 'Hello from SimpleFunction-a. Plus: ' + data.Payload
      });
      //context.succeed(data.Payload)
    }
  });
};