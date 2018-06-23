
npm-install:
	cd simplefunction-a; npm install
	cd simplefunction-c; npm install

lambda-create: lambda-create-a lambda-create-b lambda-create-c

lambda-create-a:
	cd simplefunction-a; -rm simplefunction-a.zip; zip -r simplefunction-a.zip .
	aws lambda create-function \
		--function-name simplefunction-a --runtime nodejs8.10 --role arn:aws:iam::339468856116:role/LambdaFullAccess \
		--tracing-config '{"Mode": "Active"}' \
		--handler index.handler --zip-file fileb://simplefunction-a/simplefunction-a.zip

lambda-create-b:
	cd simplefunction-b; -rm simplefunction-b.zip; zip -r simplefunction-b.zip .
	aws lambda create-function \
		--function-name simplefunction-b --runtime nodejs8.10 --role arn:aws:iam::339468856116:role/LambdaFullAccess \
		--tracing-config '{"Mode": "Active"}' \
		--handler index.handler --zip-file fileb://simplefunction-b/simplefunction-b.zip

lambda-create-c:
	cd simplefunction-c; -rm simplefunction-c.zip; zip -r simplefunction-c.zip .
	aws lambda create-function \
		--function-name simplefunction-c --runtime nodejs8.10 --role arn:aws:iam::339468856116:role/LambdaFullAccess \
		--tracing-config '{"Mode": "Active"}' \
		--handler index.handler --zip-file fileb://simplefunction-c/simplefunction-c.zip

lambda-update: lambda-update-a lambda-update-b lambda-update-c

lambda-update-a:
	cd simplefunction-a; -rm simplefunction-a.zip; zip -r simplefunction-a.zip .
	aws lambda update-function-code --function-name simplefunction-a --zip-file fileb://simplefunction-a/simplefunction-a.zip
lambda-update-b:
	cd simplefunction-b; -rm simplefunction-b.zip; zip -r simplefunction-b.zip .
	aws lambda update-function-code --function-name simplefunction-b --zip-file fileb://simplefunction-b/simplefunction-b.zip
lambda-update-c:
	cd simplefunction-c; -rm simplefunction-c.zip; zip -r simplefunction-c.zip .
	aws lambda update-function-code --function-name simplefunction-c --zip-file fileb://simplefunction-c/simplefunction-c.zip

lambda delete:
	-aws lambda delete-function --function-name simplefunction-a
	-aws lambda delete-function --function-name simplefunction-b
	-aws lambda delete-function --function-name simplefunction-c