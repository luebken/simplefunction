var xray = require('aws-xray-sdk-core');
var aws = xray.captureAWS(require('aws-sdk'));

aws.config.region = 'us-west-1';

var sns = new aws.SNS();
var dynamodb = new aws.DynamoDB();

exports.handler = (event, context, callback) => {
  
  var params = {
  Item: {
   "name": {
     S: "Somewhat Something"
    }
  }, 
  TableName: "simplefunction"
 };
  
dynamodb.putItem(params, function (err, data) {
  if (err) console.log(err, err.stack); // an error occurred
  else     console.log(data);           // successful response
});
  
  sns.publish({
    Message: 'Message from simplefunction-c',
    TopicArn: 'arn:aws:sns:us-west-1:339468856116:simplefunction'
  }, function(err, data) {
    if (err) {
      console.log(err.stack);
      return;
    }
    callback(null, {
      'statusCode': '200',
      'body': 'Hello from SimpleFunction-c.\n ' + JSON.stringify(data)
    });
  });


};
