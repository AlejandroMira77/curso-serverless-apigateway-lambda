#!/bin/bash

# Lista de usuarios

aws iam list-users

# Creación de usuarios

aws iam create-user --user-name Test-cli

# Agregar politica

aws iam attach-user-policy --user-name Test-cli --policy-arn arn:aws:iam::aws:policy/AdministratorAccess


# ejercicio de laboratorio #1
# crear 3 usuarios y agregarles una politica de solo lectura a iam

aws iam create-user --user-name lab1
aws iam create-user --user-name lab2
aws iam create-user --user-name lab3

aws iam attach-user-policy --user-name lab1 --policy-arn arn:aws:iam::aws:policy/IAMReadOnlyAccess
aws iam attach-user-policy --user-name lab2 --policy-arn arn:aws:iam::aws:policy/IAMReadOnlyAccess
aws iam attach-user-policy --user-name lab3 --policy-arn arn:aws:iam::aws:policy/IAMReadOnlyAccess


# lista de politicas del usuario

aws iam list-attached-user-policies --user-name lab1

# lista de grupos por usuario

aws iam list-groups-for-user --user-name lab2

# para desplegar el stack y crear el usuario
aws cloudformation create-stack --stack-name StackIAMUserJSON --template-body file://iam-basic-user.json --capabilities CAPABILITY_NAMED_IAM
aws cloudformation create-stack --stack-name StackIAMUserYAML --template-body file://iam-basic-user.yaml --capabilities CAPABILITY_NAMED_IAM

# listar los stack
aws cloudformation list-stacks

# listar los grupos
aws iam list-groups

# lista de usuarios por grupo
aws iam get-group --group-name Vengadores

# listar politicas de un grupo pero solo politicas administradas por aws
aws iam list-attached-group-policies --group-name Vengadores
# lista de politicas creadas por mi
aws iam list-group-policies --group-name Vengadores

# comando que consulta las credenciales del usuario que esta enlazado con aws
aws sts get-caller-identity

# ejercicio de laboratorio #2

# 1
# crear un usuario iam llamado groot
# añadir una etiqueta (tags) como Guardian: Galaxia o Tipo: Flora Coloso
# verificar el stack, el usuario, y los tags del usuario

# 2
# actualizar la plantilla para crear un grupo iam llamado vengadores
# agregar el usuario groot al grupo vengadores
# verificar el grupo, y usuarios del grupo

# 3
# crear una politica iam personalizada que permita unicamente listar buckets de s3 (s3:ListAllMyBuckets)
# asociar esa politica al grupo vengadores
# verificar las politicas del grupo

# 4
# eliminar el stack y confirmar que se eliminaron los recursos

# solucion
# cree el usuario 
aws cloudformation create-stack --stack-name StackLaboratorio2 --template-body file://laboratorio2.yaml --capabilities CAPABILITY_NAMED_IAM

# actualizar stack para agregar tags 
# pero sale error cloudformation no permite que una vez creado el usuario se le actualicen los tags
aws cloudformation update-stack --stack-name StackLaboratorio2 --template-body file://laboratorio2.yaml --capabilities CAPABILITY_NAMED_IAM

# elimine el stack para crear de nuevo el stack con el usuario y los tags 
aws cloudformation delete-stack --stack-name StackLaboratorio2

# consulte la lista de stacks y con este comando los tags de un usuario
aws iam list-user-tags --user-name groot

# listar stacks
aws cloudformation list-stacks