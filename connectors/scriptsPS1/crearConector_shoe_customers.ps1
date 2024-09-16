# Definir los encabezados
$headers = @{
    "Content-Type" = "application/json"
}

# Crear el cuerpo de la solicitud
$body = @"
{
  "connector.class": "io.confluent.kafka.connect.datagen.DatagenConnector",
  "key.converter": "org.apache.kafka.connect.storage.StringConverter",
  "value.converter": "org.apache.kafka.connect.json.JsonConverter",
  "value.converter.schemas.enable": false,
  "kafka.topic": "shoe_customers",
  "quickstart": "shoe_customers",
  "max.interval": 1,
  "iterations": 1000,
  "tasks.max": "10"
}
"@

# Enviar la solicitud HTTP PUT
Invoke-RestMethod -Method Put -Uri "http://localhost:8083/connectors/shoe_customers-connect/config" -Headers $headers -Body $body
