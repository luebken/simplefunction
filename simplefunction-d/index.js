exports.handler = (event, context, callback) => {
  console.log('simplefunction-d: received message', event.Records[0].Sns.Message)
};    
