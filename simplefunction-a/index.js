var xray = require('aws-xray-sdk-core');
var aws = xray.captureAWS(require('aws-sdk'));

var lambda = new aws.Lambda({
  region: 'us-east-1' //change to your region
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
        'body': 'HelloX from SimpleFunction-a ' + data.Payload
      });
      //context.succeed(data.Payload)
    }
  });
};