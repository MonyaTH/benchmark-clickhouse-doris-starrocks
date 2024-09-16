DROP DATABASE IF EXISTS test;

CREATE DATABASE test ON CLUSTER cluster_3S_1R;

USE test;

--#######################################################################--
--############################ TABLAS KAFKA #############################--
--#######################################################################--

CREATE TABLE test.shoes_kafka(
    id String,
    brand String,
    name String,
    sale_price Float32,
    rating Float32
) ENGINE = Kafka SETTINGS kafka_broker_list = 'kafka:29092', 
                          kafka_topic_list = 'shoes', 
                          kafka_group_name = 'clickhouse_group',
                          kafka_format = 'JSONEachRow';


CREATE TABLE test.shoe_orders_kafka(
    order_id UInt32,
    product_id String,
    customer_id String,
    ts UInt64
) ENGINE = Kafka SETTINGS kafka_broker_list = 'kafka:29092', 
                          kafka_topic_list = 'shoe_orders', 
                          kafka_group_name = 'clickhouse_group',
                          kafka_format = 'JSONEachRow';


CREATE TABLE test.shoe_customers_kafka (
    id String,
    first_name String,
    last_name String,
    email String,
    phone String,
    street_address String,
    state String,
    zip_code String,
    country String,
    country_code String
) ENGINE = Kafka SETTINGS kafka_broker_list = 'kafka:29092', 
                          kafka_topic_list = 'shoe_customers', 
                          kafka_group_name = 'clickhouse_group',
                          kafka_format = 'JSONEachRow';


CREATE TABLE test.shoe_clickstream_kafka (
    product_id String,
    user_id String,
    view_time UInt32,
    page_url String,
    ip String,
    ts UInt64
) ENGINE = Kafka SETTINGS kafka_broker_list = 'kafka:29092', 
                          kafka_topic_list = 'shoe_clickstream', 
                          kafka_group_name = 'clickhouse_group',
                          kafka_format = 'JSONEachRow';


--#######################################################################--
--########################### TABLAS LOCALES ############################--
--#######################################################################--

--***********************************************************************--
--***************************** TABLA SHOES *****************************--
--***********************************************************************--


CREATE TABLE test.shoes__sparseindex_by_id ON CLUSTER cluster_3S_1R(
    id String,
    brand String,
    name String,
    sale_price Float32,
    rating Float32
) ENGINE = MergeTree()
PRIMARY KEY id
ORDER BY id;

CREATE TABLE test.shoes__sparseindex_by_id__partitioned_by_brand ON CLUSTER cluster_3S_1R(
    id String,
    brand String,
    name String,
    sale_price Float32,
    rating Float32
) ENGINE = MergeTree()
PRIMARY KEY id
PARTITION BY brand
ORDER BY id;


CREATE TABLE test.shoes__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter ON CLUSTER cluster_3S_1R (
    id String,
    brand String,
    name String,
    sale_price Float32,
    rating Float32,
    INDEX idx_id id TYPE ngrambf_v1(4, 256, 2, 0) GRANULARITY 1, 
    INDEX idx_name name TYPE ngrambf_v1(4, 256, 2, 0) GRANULARITY 1
) ENGINE = MergeTree()
PRIMARY KEY id
PARTITION BY brand
ORDER BY id;



--***********************************************************************--
--************************** TABLA SHOE ORDERS **************************--
--***********************************************************************--

CREATE TABLE test.shoe_orders__sparseindex_by_order_id ON CLUSTER cluster_3S_1R(
    order_id UInt32,
    product_id String,
    customer_id String,
    ts UInt64
) ENGINE = MergeTree()
PRIMARY KEY order_id
ORDER BY order_id;


CREATE TABLE test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts ON CLUSTER cluster_3S_1R(
    order_id UInt32,
    product_id String,
    customer_id String,
    ts UInt64
) ENGINE = MergeTree()
PRIMARY KEY order_id
PARTITION BY toYYYYMM(toDateTime(ts/1000)) 
ORDER BY order_id;


--***********************************************************************--
--************************ TABLA SHOE CUSTOMERS *************************--
--***********************************************************************--

-- DROP TABLE shoe_customers;

CREATE TABLE test.shoe_customers__sparseindex_by_id ON CLUSTER cluster_3S_1R(
    id String,
    first_name String,
    last_name String,
    email String,
    phone String,
    street_address String,
    state String,
    zip_code String,
    country String,
    country_code String
) ENGINE = MergeTree()
PRIMARY KEY id
ORDER BY id;


CREATE TABLE test.shoe_customers__sparseindex_by_id__partitioned_by_state ON CLUSTER cluster_3S_1R(
    id String,
    first_name String,
    last_name String,
    email String,
    phone String,
    street_address String,
    state String,
    zip_code String,
    country String,
    country_code String
) ENGINE = MergeTree()
PRIMARY KEY id
PARTITION BY state
ORDER BY id;



--***********************************************************************--
--*********************** TABLA SHOE CLICKSTREAM ************************--
--***********************************************************************--

CREATE TABLE test.shoe_clickstream__sparseindex_by_page_url ON CLUSTER cluster_3S_1R(
    page_url String,
    product_id String,
    user_id String,
    view_time UInt32,
    ip String,
    ts UInt64
) ENGINE = MergeTree()
PRIMARY KEY page_url
ORDER BY page_url;

CREATE TABLE test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts ON CLUSTER cluster_3S_1R(
    page_url String,
    product_id String,
    user_id String,
    view_time UInt32,
    ip String,
    ts UInt64
) ENGINE = MergeTree()
PRIMARY KEY page_url
PARTITION BY toDate(toDateTime(ts/1000)) 
ORDER BY page_url;




 
--#######################################################################--
--######################## VISTAS MATERIALIZADAS ########################--
--#######################################################################--

--***********************************************************************--
--***************************** TABLA SHOES *****************************--
--***********************************************************************--

CREATE MATERIALIZED VIEW test.shoes__sparseindex_by_id_mv
TO test.shoes__sparseindex_by_id AS
SELECT *
FROM test.shoes_kafka;

CREATE MATERIALIZED VIEW test.shoes__sparseindex_by_id__partitioned_by_brand_mv 
TO test.shoes__sparseindex_by_id__partitioned_by_brand AS
SELECT *
FROM test.shoes_kafka;

CREATE MATERIALIZED VIEW test.shoes__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter_mv
TO test.shoes__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter AS
SELECT *
FROM test.shoes_kafka;



--***********************************************************************--
--************************** TABLA SHOE ORDERS **************************--
--***********************************************************************--

CREATE MATERIALIZED VIEW test.shoe_orders__sparseindex_by_order_id_mv 
TO test.shoe_orders__sparseindex_by_order_id AS
SELECT *
FROM test.shoe_orders_kafka;


CREATE MATERIALIZED VIEW test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts_mv 
TO test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS
SELECT *
FROM test.shoe_orders_kafka;


--***********************************************************************--
--************************ TABLA SHOE CUSTOMERS *************************--
--***********************************************************************--


CREATE MATERIALIZED VIEW test.shoe_customers__sparseindex_by_id_mv 
TO test.shoe_customers__sparseindex_by_id AS
SELECT *
FROM test.shoe_customers_kafka;


CREATE MATERIALIZED VIEW test.shoe_customers__sparseindex_by_id__partitioned_by_state_mv 
TO test.shoe_customers__sparseindex_by_id__partitioned_by_state AS
SELECT *
FROM test.shoe_customers_kafka;


--***********************************************************************--
--*********************** TABLA SHOE CLICKSTREAM ************************--
--***********************************************************************--


CREATE MATERIALIZED VIEW test.shoe_clickstream__sparseindex_by_page_url_mv 
TO test.shoe_clickstream__sparseindex_by_page_url AS
SELECT *
FROM test.shoe_clickstream_kafka;


CREATE MATERIALIZED VIEW test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts_mv 
TO test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS
SELECT *
FROM test.shoe_clickstream_kafka;





--#######################################################################--
--######################### TABLAS DISTRIBUIDAS #########################--
--#######################################################################--

--***********************************************************************--
--***************************** TABLA SHOES *****************************--
--***********************************************************************--

CREATE TABLE test.shoes__sparseindex_by_id__distributed_by_id ON CLUSTER cluster_3S_1R 
          AS test.shoes__sparseindex_by_id 
ENGINE = Distributed('cluster_3S_1R','test','shoes__sparseindex_by_id', murmurHash3_64('id'));


CREATE TABLE test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id ON CLUSTER cluster_3S_1R 
        AS test.shoes__sparseindex_by_id__partitioned_by_brand 
ENGINE = Distributed('cluster_3S_1R','test','shoes__sparseindex_by_id__partitioned_by_brand', murmurHash3_64('id'));


CREATE TABLE test.shoes__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter__distributed_by_id ON CLUSTER cluster_3S_1R 
        AS test.shoes__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter 
ENGINE = Distributed('cluster_3S_1R','test','shoes__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter', murmurHash3_64('id'));




--***********************************************************************--
--************************** TABLA SHOE ORDERS **************************--
--***********************************************************************--

CREATE TABLE test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id ON CLUSTER cluster_3S_1R 
          AS test.shoe_orders__sparseindex_by_order_id 
ENGINE = Distributed('cluster_3S_1R','test','shoe_orders__sparseindex_by_order_id', murmurHash3_64('order_id'));


CREATE TABLE test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id ON CLUSTER cluster_3S_1R 
          AS test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts 
ENGINE = Distributed('cluster_3S_1R','test','shoe_orders__sparseindex_by_order_id__partitioned_by_ts', murmurHash3_64('order_id'));



--***********************************************************************--
--************************ TABLA SHOE CUSTOMERS *************************--
--***********************************************************************--

CREATE TABLE test.shoe_customers__sparseindex_by_id__distributed_by_id ON CLUSTER cluster_3S_1R 
          AS test.shoe_customers__sparseindex_by_id 
ENGINE = Distributed('cluster_3S_1R','test','shoe_customers__sparseindex_by_id', murmurHash3_64('id'));


CREATE TABLE test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id ON CLUSTER cluster_3S_1R 
          AS test.shoe_customers__sparseindex_by_id__partitioned_by_state 
ENGINE = Distributed('cluster_3S_1R','test','shoe_customers__sparseindex_by_id__partitioned_by_state', murmurHash3_64('id'));




--***********************************************************************--
--*********************** TABLA SHOE CLICKSTREAM ************************--
--***********************************************************************--

CREATE TABLE test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url ON CLUSTER cluster_3S_1R 
          AS test.shoe_clickstream__sparseindex_by_page_url 
ENGINE = Distributed('cluster_3S_1R','test','shoe_clickstream__sparseindex_by_page_url', murmurHash3_64('page_url'));

CREATE TABLE test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url ON CLUSTER cluster_3S_1R 
          AS test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts 
ENGINE = Distributed('cluster_3S_1R','test','shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts', murmurHash3_64('page_url'));

