#######################################################################
########################### PASOS INICIALES ###########################
#######################################################################

cd ./cluster_clickhouse

docker compose up -d

./crearConectores.sh


docker exec -it clickhouse01 bash

clickhouse-client

-- clickhouse-client --multiquery < create.sql

clickhouse-client --multiquery < test.sql




clickhouse-client --query "DETACH TABLE test.shoes_kafka;"
clickhouse-client --query "ATTACH TABLE test.shoes_kafka;"

clickhouse-client --query "DETACH TABLE test.shoe_orders_kafka;"
clickhouse-client --query "ATTACH TABLE test.shoe_orders_kafka;"

clickhouse-client --query "DETACH TABLE test.shoe_customers_kafka;"
clickhouse-client --query "ATTACH TABLE test.shoe_customers_kafka;"

clickhouse-client --query "DETACH TABLE test.shoe_clickstream_kafka;"
clickhouse-client --query "ATTACH TABLE test.shoe_clickstream_kafka;"




-- En cada nodo hay que ejecutar lo siguiente para poder hacer uniones entre tablas distribuidas
SET distributed_product_mode = 'allow';

http://localhost:8124/dashboard

 

#######################################################################
######################### CONSULTAS METADATOS #########################
#######################################################################
-- consulta de tiempo ejecucion, numero de filas leidas y bytes leidos
SELECT
    formatReadableQuantity(query_duration_ms) AS query_duration_ms,
    formatReadableQuantity(read_rows) AS read_rows,
    formatReadableQuantity(read_bytes) AS read_bytes
FROM system.query_log
WHERE query_id = (SELECT query_id FROM system.query_log ORDER BY event_time DESC LIMIT 1)\G


SELECT
    part_type,
    path,
    formatReadableQuantity(rows) AS rows,
    formatReadableSize(data_uncompressed_bytes) AS data_uncompressed_bytes,
    formatReadableSize(data_compressed_bytes) AS data_compressed_bytes,
    formatReadableSize(primary_key_bytes_in_memory) AS primary_key_bytes_in_memory,
    marks,
    formatReadableSize(bytes_on_disk) AS bytes_on_disk
FROM system.parts
WHERE (table = 'shoe_orders_table') AND (active = 1)
FORMAT Vertical;

-- PARA SABER LA CARDINALIDAD DE LAS COLUMNAS 
SELECT
    formatReadableQuantity(uniq(id)) AS cardinality_id,
    formatReadableQuantity(uniq(brand)) AS cardinality_brand,
    formatReadableQuantity(uniq(name)) AS cardinality_name,
    formatReadableQuantity(uniq(sale_price)) AS cardinality_sale_price,
    formatReadableQuantity(uniq(rating)) AS cardinality_rating
FROM shoes_table


SELECT
    formatReadableQuantity(uniq(order_id)) AS cardinality_order_id,
    formatReadableQuantity(uniq(product_id)) AS cardinality_product_id,
    formatReadableQuantity(uniq(customer_id)) AS cardinality_customer_id,
    formatReadableQuantity(uniq(ts)) AS cardinality_ts
FROM shoe_orders_table

SELECT
    formatReadableQuantity(uniq(id)) AS cardinality_id,
    formatReadableQuantity(uniq(first_name)) AS cardinality_first_name,
    formatReadableQuantity(uniq(last_name)) AS cardinality_last_name,
    formatReadableQuantity(uniq(email)) AS cardinality_email,
    formatReadableQuantity(uniq(phone)) AS cardinality_phone,
    formatReadableQuantity(uniq(street_address)) AS cardinality_street_address,
    formatReadableQuantity(uniq(state)) AS cardinality_state,
    formatReadableQuantity(uniq(zip_code)) AS cardinality_zip_code,
    formatReadableQuantity(uniq(country)) AS cardinality_country,
    formatReadableQuantity(uniq(country_code)) AS cardinality_country_code
FROM shoe_customers_table


SELECT
    formatReadableQuantity(uniq(product_id)) AS cardinality_product_id,
    formatReadableQuantity(uniq(user_id)) AS cardinality_user_id,
    formatReadableQuantity(uniq(view_time)) AS cardinality_view_time,
    formatReadableQuantity(uniq(page_url)) AS cardinality_page_url,
    formatReadableQuantity(uniq(ip)) AS cardinality_ip,
    formatReadableQuantity(uniq(ts)) AS cardinality_ts
FROM shoe_clickstream_table


-- Puede ver qué tan comprimidos están sus datos por columna.
-- Esta consulta también devuelve el tamaño de sus índices primarios en la memoria
SELECT
    parts.*,
    columns.compressed_size,
    columns.uncompressed_size,
    columns.compression_ratio,
    columns.compression_percentage
FROM
(
    SELECT
        table,
        formatReadableSize(sum(data_uncompressed_bytes)) AS uncompressed_size,
        formatReadableSize(sum(data_compressed_bytes)) AS compressed_size,
        round(sum(data_compressed_bytes) / sum(data_uncompressed_bytes), 3) AS compression_ratio,
        round(100 - ((sum(data_compressed_bytes) * 100) / sum(data_uncompressed_bytes)), 3) AS compression_percentage
    FROM system.columns
    GROUP BY table
) AS columns
RIGHT JOIN
(
    SELECT
        table,
        sum(rows) AS rows,
        max(modification_time) AS latest_modification,
        formatReadableSize(sum(bytes)) AS disk_size,
        formatReadableSize(sum(primary_key_bytes_in_memory)) AS primary_keys_size,
        any(engine) AS engine,
        sum(bytes) AS bytes_size
    FROM system.parts
    WHERE active
    GROUP BY
        database,
        table
) AS parts ON columns.table = parts.table
ORDER BY parts.bytes_size DESC


SELECT
    table AS Table,
    name AS Column,
    formatReadableSize(data_uncompressed_bytes) AS Uncompressed,
    formatReadableSize(data_compressed_bytes) AS Compressed,
    round(data_uncompressed_bytes / data_compressed_bytes, 0) AS Ratio
FROM system.columns
WHERE (table = 'shoe_orders_table3' OR table = 'shoe_orders_table4') AND (name = 'customer_id')
ORDER BY Ratio ASC
