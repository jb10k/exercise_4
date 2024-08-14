#!/bin/bash

# Получаем последние изменения из Git
git pull origin master

# Применяем изменения к конфигурации кластера Kafka
KAFKA_HOME=/path/to/kafka
$KAFKA_HOME/bin/kafka-acls.sh --authorizer-properties ./kafka_acl_config.properties --add --allow-principal User:dev_user --operation All --operation All --topic Test

# Коммитим изменения в Git
git add .
git commit -m "Update Kafka ACL configuration"
git push origin master
