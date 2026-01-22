#!/bin/bash

echo "Criando diretórios..."

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

echo "Criando grupos de usuários..."

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Criando usuários..."

useradd -m -s /bin/bash -G GRP_ADM carlos
useradd -m -s /bin/bash -G GRP_ADM maria
useradd -m -s /bin/bash -G GRP_ADM joao

useradd -m -s /bin/bash -G GRP_VEN debora
useradd -m -s /bin/bash -G GRP_VEN sebastiana
useradd -m -s /bin/bash -G GRP_VEN roberto

useradd -m -s /bin/bash -G GRP_SEC josefina
useradd -m -s /bin/bash -G GRP_SEC amanda
useradd -m -s /bin/bash -G GRP_SEC rogerio

echo "Definição de senha temporaria..."

echo "carlos:Senha123" | chpasswd
echo "maria:Senha123" | chpasswd
echo "joao:Senha123" | chpasswd
echo "debora:Senha123" | chpasswd
echo "sebastiana:Senha123" | chpasswd
echo "roberto:Senha123" | chpasswd
echo "josefina:Senha123" | chpasswd
echo "amanda:Senha123" | chpasswd
echo "rogerio:Senha123" | chpasswd

echo "Forçar a troca de senha no login..."

chage -d 0 carlos
chage -d 0 maria
chage -d 0 joao
chage -d 0 debora
chage -d 0 sebastiana
chage -d 0 roberto
chage -d 0 josefina
chage -d 0 amanda
chage -d 0 rogerio

echo "Especificando permissões dos diretórios..."

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Fim..."