#!/bin/bash

# Definir los encabezados
headers="Content-Type: application/json"

# Crear el cuerpo de la solicitud
body=$(cat <<EOF
{
  "connector.class": "io.confluent.kafka.connect.datagen.DatagenConnector",
  "key.converter": "org.apache.kafka.connect.storage.StringConverter",
  "value.converter": "org.apache.kafka.connect.json.JsonConverter",
  "value.converter.schemas.enable": false,
  "kafka.topic": "shoes",
  "quickstart": "shoes",
  "max.interval": 100,
  "iterations": 10000000,
  "tasks.max": "1"
}
EOF
)

# Enviar la solicitud HTTP PUT
curl -X PUT \
  -H "$headers" \
  -d "$body" \
  http://localhost:8083/connectors/shoes-connect/config
