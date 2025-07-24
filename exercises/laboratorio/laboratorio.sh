# crear una lambda url con autenticación aws_iam que simula un contador
# el contador se incrementa con cada invocación y se reinicia en 0 si la lambda pasa por un cold start

# paso 1
# definir un contador fuera del handler para mantener su valor en invocaciones calientes
# el contador aumentara en 1 por cada invocación mientras que la lambda este en caliente
# retornar el valor del contador con el mensaje esta haciendo frio si la lambda esta en estado "cold start"

# paso 2
# comprimir el codigo en un archivo

# paso 3
# subirlo a un bucket s3
aws s3 cp exercises/laboratorio/index.zip s3://antonella-course-us-east-1/laboratorio/cold_start.zip

# paso 4
# crear plantilla cloudformation
# definir la lambda
# crear una lambda url autenticada para invocar la funcion
# asignar permisos para que la url puede invocar la lambda
# crea el rol para la funcion

# paso 5
# desplegar
# consultar la diferencia de aws cloudformation create-stack o aws cloudformation deploy
# create-stack - crea un stack si no existe - y en vez de template-body es template file
# deploy - actualiza o crea un stack
aws cloudformation create-stack --stack-name StackLambdaColdStart --template-body file://exercises/laboratorio/laboratorio.yaml --capabilities CAPABILITY_NAMED_IAM

# paso 6
# obtener la url de la lambda
aws lambda get-function-url-config --function-name lambda-cold-start
# https://63wbp54htfg27dfic22zlozrhq0xngpq.lambda-url.us-east-1.on.aws/


# paso 7
# usa awscurl para invocar la url
# la primera invocacion mostrara un mensaje indicando que hubo un cold start
# la siguiente invocacion incrementara el contador
# si la lambda queda inactiva por un tiempo y entra en cold start nuevamente el contador se reiniciara
awscurl --service lambda --region us-east-1 -X GET https://63wbp54htfg27dfic22zlozrhq0xngpq.lambda-url.us-east-1.on.aws/

# paso 8
# reduce el timeout de la lambda para forzar un error 502 si tarda demasiado en responder

# paso 9
# eliminar stack
aws cloudformation delete-stack --stack-name StackLambdaColdStart