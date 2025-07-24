# copiar un archivo al bucket con una carpeta
aws s3 cp exercises/lambda/code.zip s3://antonella-course-us-east-1/practice_html/function_html.zip

# comando para crear el stack del bucket
aws cloudformation create-stack --stack-name StackHTMLLambda --template-body file://exercises/lambda/html.yaml --capabilities CAPABILITY_IAM

# obtener la url que creamos de la lambda
aws lambda get-function-url-config --function-name lambda-html

# comando para actualizar los paquetes de ubuntu
sudo apt update
sudo apt upgrade

# instalar pip para python
sudo apt install python3-pip -y

# copiar archivo con actualizacion de codigo
aws s3 cp exercises/lambda/code-fix.zip s3://antonella-course-us-east-1/practice_html/function_html_fix.zip

# se crea un nuevo stack
aws cloudformation create-stack --stack-name StackHTMLLambda --template-body file://exercises/lambda/html.yaml --capabilities CAPABILITY_IAM



#------------------------------



# Un entorno virtual (o venv) es una carpeta aislada donde puedes instalar paquetes de Python sin afectar tu sistema operativo ni otros proyectos.
# un "mini Python independiente" dentro de tu proyecto.

# comando para instalar el módulo venv para tu versión de Python
sudo apt install python3.12-venv -y

# se crea el entorno virtual
python3 -m venv venv

# activar el entorno virtual
source venv/bin/activate
# desactivar
deactivate

# actualizar pip
pip install --upgrade pip

# instalar dependencia aws curl
pip install awscurl

# probar el curl
awscurl --service lambda --region us-east-1 -X GET https://rjywy6jfovtfwiaqz7pmyrdlki0dhxvo.lambda-url.us-east-1.on.aws/