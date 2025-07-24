# crear el role para la funcion lambda
aws iam create-role \
    --role-name rol-lambda-cli \
    --assume-role-policy-document file://lambda/trust-policy.json
    # politica de confianza define quien asume el role (users, servicios, cuentas)

aws lambda create-function \
    --function-name my-first-function-cli \
    --runtime python3.13 \
    --handler code.lambda_handler \
    --zip-file fileb://lambda/code.zip \
    --role arn:aws:iam::185226996839:role/rol-lambda-cli

# comando para crear el stack del bucket
aws cloudformation create-stack --stack-name StackBucketS3 --template-body file://lambda/s3.yaml

# copiar un archivo al bucket
aws s3 cp lambda/code.zip s3://antonella-course-us-east-1/function.zip

# vaciar un bucket para luego eliminarlo
aws s3 rm s3://cf-templates-1hsssajg30fie-us-east-1 --recursive
aws s3api delete-bucket --bucket cf-templates-1hsssajg30fie-us-east-1 --region us-east-1

# output de un stack
aws cloudformation describe-stacks --stack-name StackBucketS3

# un role tiene lo que puede hacer y quien puede asumirlo
# en lambda.yaml el quien puede asumirlo seria el role

# se crea el stack para la lambda
aws cloudformation create-stack --stack-name FirstStackLambda --template-body file://lambda/lambda.yaml --capabilities CAPABILITY_NAMED_IAM