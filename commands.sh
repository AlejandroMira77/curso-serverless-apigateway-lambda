# crear la api y su stack
aws cloudformation deploy --template-file template.yaml --stack-name StackApiGateway

# deploy para subir el archivo api-pets.yaml
aws cloudformation deploy --template-file template.yaml --stack-name StackApiGateway
# pero sale error porque el parametro no es una ubicacion de s3 valida


# va a generar un nuevo archivo template va a subir los archivos locales al bucket
aws cloudformation package --template-file template.yaml --s3-bucket antonella-course-us-east-1 --output-template-file packaged-template.yaml

# deploy con la nueva plantilla creada
aws cloudformation deploy --template-file packaged-template.yaml --stack-name StackApiGateway


# pequeño reto de agregar una lambda la cual responde con hola mundo y una variable de entorno

# copiamos el archivo de la lambda en el bucket
aws s3 cp api-gateway/index.zip s3://antonella-course-us-east-1/apigateway/api.zip

# actualizamos el stack para subir la lambda
aws cloudformation package --template-file template.yaml --s3-bucket antonella-course-us-east-1 --output-template-file packaged-template.yaml
aws cloudformation deploy --template-file packaged-template.yaml --stack-name StackApiGateway

# actualizamos el stack con la solucion del video
aws cloudformation package --template-file template.yaml --s3-bucket antonella-course-us-east-1 --output-template-file packaged-template.yaml
aws cloudformation deploy --template-file packaged-template.yaml --stack-name StackApiGateway --capabilities CAPABILITY_NAMED_IAM


# cual es la mayor capacidad de variables de entorno en una funcion lambda
# no esta radicada en la cantidad de variables de entorno si no el tamaño
# el tamaño es 4kb

# comando para validar primero que cambios se van hacer (--no-execute-changeset)
aws cloudformation package --template-file template.yaml --s3-bucket antonella-course-us-east-1 --output-template-file packaged-template.yaml
aws cloudformation deploy --template-file packaged-template.yaml --stack-name StackApiGateway --capabilities CAPABILITY_NAMED_IAM --parameter-overrides pNameProject=CourseUdemy --no-execute-changeset

# este es el comando que genera
aws cloudformation describe-change-set --change-set-name arn:aws:cloudformation:us-east-1:185226996839:changeSet/awscli-cloudformation-package-deploy-1753224484/8136888e-178e-4e97-9774-c0b58c6e9911
aws cloudformation deploy --template-file packaged-template.yaml --stack-name StackApiGateway --capabilities CAPABILITY_NAMED_IAM --parameter-overrides pNameProject=CourseUdemy