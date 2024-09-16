
USE test;

--***********************************************************************--
--***************************** TABLA SHOES *****************************--
--***********************************************************************--

CREATE TABLE shoes__duplicatekey__sparseindex_by_id (
    id VARCHAR(36),
    brand VARCHAR(32),
    name VARCHAR(24),
    sale_price FLOAT,
    rating FLOAT
)
DUPLICATE KEY(id)
PROPERTIES (
    "replication_num" = "1"
);


CREATE TABLE shoes__duplicatekey__sparseindex_by_id__distributed_by_id (
    id VARCHAR(36),
    brand VARCHAR(32),
    name VARCHAR(24),
    sale_price FLOAT,
    rating FLOAT
)
DUPLICATE KEY(id)
DISTRIBUTED BY HASH(id)
PROPERTIES (
    "replication_num" = "3"
);

CREATE TABLE shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand(
    id VARCHAR(36),
    brand VARCHAR(32) NOT NULL,
    name VARCHAR(24),
    sale_price FLOAT,
    rating FLOAT
)
DUPLICATE KEY(id)
PARTITION BY (brand)
PROPERTIES (
    "replication_num" = "1"
);


CREATE TABLE shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__distributed_by_id (
    id VARCHAR(36),
    brand VARCHAR(32) NOT NULL,
    name VARCHAR(24),
    sale_price FLOAT,
    rating FLOAT
)
DUPLICATE KEY(id)
PARTITION BY (brand)
DISTRIBUTED BY HASH(id)
PROPERTIES (
    "replication_num" = "3"
);

CREATE TABLE shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter (
    id VARCHAR(36),
    brand VARCHAR(32) NOT NULL,
    name VARCHAR(24),
    sale_price FLOAT,
    rating FLOAT,
    INDEX idx_id (id) USING NGRAMBF ("gram_num" = "4", "bloom_filter_fpp" = "0.025"),
    INDEX idx_name (name) USING NGRAMBF ("gram_num" = "4", "bloom_filter_fpp" = "0.025") 
)
DUPLICATE KEY(id)
PARTITION BY (brand)
PROPERTIES (
    "replication_num" = "1"
);


CREATE TABLE shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter__distributed_by_id (
    id VARCHAR(36),
    brand VARCHAR(32) NOT NULL,
    name VARCHAR(24),
    sale_price FLOAT,
    rating FLOAT,
    INDEX idx_id (id) USING NGRAMBF ("gram_num" = "4", "bloom_filter_fpp" = "0.025"),
    INDEX idx_name (name) USING NGRAMBF ("gram_num" = "4", "bloom_filter_fpp" = "0.025") 
)
DUPLICATE KEY(id)
PARTITION BY (brand)
DISTRIBUTED BY HASH(id)
PROPERTIES (
    "replication_num" = "3"
);

CREATE TABLE shoes__primarykey__sparseindex_by_id__partitioned_by_brand__distributed_by_id (
    id VARCHAR(36),
    brand VARCHAR(32),
    name VARCHAR(24),
    sale_price FLOAT,
    rating FLOAT
)
PRIMARY KEY (id, brand)
PARTITION BY (brand)
DISTRIBUTED BY HASH(id)
ORDER BY (id)
PROPERTIES (
    "replication_num" = "3"
);


--------------------------------------------------------------------
------------------------ RUTINA TABLA SHOES ------------------------
--------------------------------------------------------------------

CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoes_1
 ON shoes__duplicatekey__sparseindex_by_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.id\", \"$.brand\", \"$.name\", \"$.sale_price\", \"$.rating\"]"  
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoes",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoes_2
 ON shoes__duplicatekey__sparseindex_by_id__distributed_by_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.id\", \"$.brand\", \"$.name\", \"$.sale_price\", \"$.rating\"]"  
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoes",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoes_3
 ON shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.id\", \"$.brand\", \"$.name\", \"$.sale_price\", \"$.rating\"]"  
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoes",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);



CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoes_4
 ON shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__distributed_by_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.id\", \"$.brand\", \"$.name\", \"$.sale_price\", \"$.rating\"]"  
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoes",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoes_5
 ON shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.id\", \"$.brand\", \"$.name\", \"$.sale_price\", \"$.rating\"]"  
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoes",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoes_6
 ON shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter__distributed_by_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.id\", \"$.brand\", \"$.name\", \"$.sale_price\", \"$.rating\"]"  
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoes",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoes_7
 ON shoes__primarykey__sparseindex_by_id__partitioned_by_brand__distributed_by_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.id\", \"$.brand\", \"$.name\", \"$.sale_price\", \"$.rating\"]"  
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoes",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


--***********************************************************************--
--************************** TABLA SHOE ORDERS **************************--
--***********************************************************************--

CREATE TABLE shoe_orders__duplicatekey__sparseindex_by_order_id(
    order_id INT,
    product_id VARCHAR(36),
    customer_id VARCHAR(36),
    ts BIGINT
)
DUPLICATE KEY (order_id)
PROPERTIES (
    "replication_num" = "1"
);


CREATE TABLE shoe_orders__duplicatekey__sparseindex_by_order_id__distributed_by_order_id(
    order_id INT,
    product_id VARCHAR(36),
    customer_id VARCHAR(36),
    ts BIGINT
)
DUPLICATE KEY (order_id)
DISTRIBUTED BY HASH(order_id)
PROPERTIES (
    "replication_num" = "3"
);

CREATE TABLE shoe_orders__duplicatekey__sparseindex_by_order_id__partitioned_by_ts (
    order_id INT,
    product_id VARCHAR(36),
    customer_id VARCHAR(36),
    ts BIGINT NOT NULL
)
DUPLICATE KEY (order_id)
PARTITION BY RANGE(ts) ( 
    START ("1609459200000") END ("1610459200000") EVERY (172800000)    
)
PROPERTIES (
    "replication_num" = "1"
);


CREATE TABLE shoe_orders__duplicatekey__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id (
    order_id INT,
    product_id VARCHAR(36),
    customer_id VARCHAR(36),
    ts BIGINT NOT NULL
)
DUPLICATE KEY (order_id)
PARTITION BY RANGE(ts) ( 
    START ("1609459200000") END ("1610459200000") EVERY (172800000)    
)
DISTRIBUTED BY HASH(order_id)
PROPERTIES (
    "replication_num" = "3"
);

-- CÁLCULO DEL RANGO DE FECHAS
-- FECHA DE INICIO ESTÁ EN EL GIT DEL CONECTOR: 1609459200000
-- PASOS (ESTAN EN EL GIT TMBN) DE: 100000
-- NF: NUMERO DE FILAS QUE SE ESPERA TENER EN LA BD PARA HACER LAS PRUEBAS 
-- FECHA DE FIN: FECHA_INICIO + NF*PASO = 1609459200000 + 60K*100K 
-- INTERVALOS EN LA TABLA EVERY: Para cada 10K añadir 1'2 días (hecho por regla de 3, si para 60K son 7 dias cuanto es para 10K)

CREATE TABLE shoe_orders__primarykey__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id (
    order_id INT,
    ts BIGINT NOT NULL,
    product_id VARCHAR(36),
    customer_id VARCHAR(36)
)
PRIMARY KEY (order_id, ts)
PARTITION BY RANGE(ts) (
    START ("1609459200000") END ("1610459200000") EVERY (172800000)    
)
DISTRIBUTED BY HASH(order_id)
ORDER BY (order_id)
PROPERTIES (
    "replication_num" = "3"
);


--------------------------------------------------------------------
--------------------- RUTINA TABLA SHOE ORDERS ---------------------
--------------------------------------------------------------------

CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_orders_1 
 ON shoe_orders__duplicatekey__sparseindex_by_order_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[ \"$.order_id\",\"$.product_id\",\"$.customer_id\", \"$.ts\"]"  
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_orders",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);

CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_orders_2
 ON shoe_orders__duplicatekey__sparseindex_by_order_id__distributed_by_order_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[ \"$.order_id\",\"$.product_id\",\"$.customer_id\", \"$.ts\"]"  
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_orders",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);

CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_orders_3
 ON shoe_orders__duplicatekey__sparseindex_by_order_id__partitioned_by_ts
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[ \"$.order_id\",\"$.product_id\",\"$.customer_id\", \"$.ts\"]"  
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_orders",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);

CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_orders_4
 ON shoe_orders__duplicatekey__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[ \"$.order_id\",\"$.product_id\",\"$.customer_id\", \"$.ts\"]"  
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_orders",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);

CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_orders_5
 ON shoe_orders__primarykey__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[ \"$.order_id\", \"$.ts\", \"$.product_id\",\"$.customer_id\"]"  
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_orders",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


--***********************************************************************--
--************************ TABLA SHOE CUSTOMERS *************************--
--***********************************************************************--

CREATE TABLE shoe_customers__duplicatekey__sparseindex_by_id (
    id VARCHAR(36),
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(128),
    phone VARCHAR(12),
    street_address VARCHAR(48),
    state VARCHAR(25),
    zip_code VARCHAR(10),
    country VARCHAR(13),
    country_code CHAR(3)
)
DUPLICATE KEY (id)
PROPERTIES (
    "replication_num" = "1"
);


CREATE TABLE shoe_customers__duplicatekey__sparseindex_by_id__distributed_by_id (
    id VARCHAR(36),
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(128),
    phone VARCHAR(12),
    street_address VARCHAR(48),
    state VARCHAR(25),
    zip_code VARCHAR(10),
    country VARCHAR(13),
    country_code CHAR(3)
)
DUPLICATE KEY (id)
DISTRIBUTED BY HASH(id)
PROPERTIES (
    "replication_num" = "3"
);


CREATE TABLE shoe_customers__duplicatekey__sparseindex_by_id__partitioned_by_state (
    id VARCHAR(36),
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(128),
    phone VARCHAR(12),
    street_address VARCHAR(48),
    state VARCHAR(25) NOT NULL,
    zip_code VARCHAR(10),
    country VARCHAR(13),
    country_code CHAR(3)
)
DUPLICATE KEY (id)
PARTITION BY LIST(state)
(
    PARTITION `p_nueva_inglaterra` VALUES IN ("Maine", "New Hampshire", "Vermont", "Massachusetts", "Rhode Island", "Connecticut"),
    PARTITION `p_medio_atlantico` VALUES IN ("New York", "Pennsylvania", "New Jersey", "Delaware", "Maryland", "District of Columbia"),
    PARTITION `p_sur_atlantico` VALUES IN ("Virginia", "West Virginia", "North Carolina", "South Carolina", "Georgia", "Florida"),
    PARTITION `p_sur_central` VALUES IN ("Kentucky", "Tennessee", "Alabama", "Mississippi", "Arkansas", "Louisiana", "Oklahoma", "Texas"),
    PARTITION `p_medio_oeste` VALUES IN ("Ohio", "Indiana", "Illinois", "Michigan", "Wisconsin"),
    PARTITION `p_noroeste_central` VALUES IN ("Minnesota", "Iowa", "Missouri", "Kansas", "Nebraska", "South Dakota", "North Dakota"),
    PARTITION `p_oeste` VALUES IN ("Montana", "Idaho", "Wyoming", "Colorado", "New Mexico", "Arizona", "Utah", "Nevada"),
    PARTITION `p_pacifico` VALUES IN ("Washington", "Oregon", "California", "Alaska", "Hawaii")
)
PROPERTIES (
    "replication_num" = "1"
);

CREATE TABLE shoe_customers__duplicatekey__sparseindex_by_id__partitioned_by_state__distributed_by_id (
    id VARCHAR(36),
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(128),
    phone VARCHAR(12),
    street_address VARCHAR(48),
    state VARCHAR(25) NOT NULL,
    zip_code VARCHAR(10),
    country VARCHAR(13),
    country_code CHAR(3)
)
DUPLICATE KEY (id)
PARTITION BY LIST(state)
(
    PARTITION `p_nueva_inglaterra` VALUES IN ("Maine", "New Hampshire", "Vermont", "Massachusetts", "Rhode Island", "Connecticut"),
    PARTITION `p_medio_atlantico` VALUES IN ("New York", "Pennsylvania", "New Jersey", "Delaware", "Maryland", "District of Columbia"),
    PARTITION `p_sur_atlantico` VALUES IN ("Virginia", "West Virginia", "North Carolina", "South Carolina", "Georgia", "Florida"),
    PARTITION `p_sur_central` VALUES IN ("Kentucky", "Tennessee", "Alabama", "Mississippi", "Arkansas", "Louisiana", "Oklahoma", "Texas"),
    PARTITION `p_medio_oeste` VALUES IN ("Ohio", "Indiana", "Illinois", "Michigan", "Wisconsin"),
    PARTITION `p_noroeste_central` VALUES IN ("Minnesota", "Iowa", "Missouri", "Kansas", "Nebraska", "South Dakota", "North Dakota"),
    PARTITION `p_oeste` VALUES IN ("Montana", "Idaho", "Wyoming", "Colorado", "New Mexico", "Arizona", "Utah", "Nevada"),
    PARTITION `p_pacifico` VALUES IN ("Washington", "Oregon", "California", "Alaska", "Hawaii")
)
DISTRIBUTED BY HASH(id)
PROPERTIES (
    "replication_num" = "3"
);


CREATE TABLE shoe_customers__duplicatekey__sparseindex_by_id__partitioned_by_state__bitmap_index__distributed_by_id (
    id VARCHAR(36),
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(128),
    phone VARCHAR(12),
    street_address VARCHAR(48),
    state VARCHAR(25) NOT NULL,
    zip_code VARCHAR(10),
    country VARCHAR(13),
    country_code CHAR(3),
    INDEX idx_id (id) USING BITMAP,
    INDEX idx_first_name (first_name) USING BITMAP,
    INDEX idx_last_name (last_name) USING BITMAP,
    INDEX idx_email (email) USING BITMAP,
    INDEX idx_phone (phone) USING BITMAP,
    INDEX idx_street_address (street_address) USING BITMAP,
    INDEX idx_state (state) USING BITMAP,
    INDEX idx_zip_code (zip_code) USING BITMAP,
    INDEX idx_country (country) USING BITMAP,
    INDEX idx_country_code (country_code) USING BITMAP
)
DUPLICATE KEY (id)
PARTITION BY LIST(state)
(
    PARTITION `p_nueva_inglaterra` VALUES IN ("Maine", "New Hampshire", "Vermont", "Massachusetts", "Rhode Island", "Connecticut"),
    PARTITION `p_medio_atlantico` VALUES IN ("New York", "Pennsylvania", "New Jersey", "Delaware", "Maryland", "District of Columbia"),
    PARTITION `p_sur_atlantico` VALUES IN ("Virginia", "West Virginia", "North Carolina", "South Carolina", "Georgia", "Florida"),
    PARTITION `p_sur_central` VALUES IN ("Kentucky", "Tennessee", "Alabama", "Mississippi", "Arkansas", "Louisiana", "Oklahoma", "Texas"),
    PARTITION `p_medio_oeste` VALUES IN ("Ohio", "Indiana", "Illinois", "Michigan", "Wisconsin"),
    PARTITION `p_noroeste_central` VALUES IN ("Minnesota", "Iowa", "Missouri", "Kansas", "Nebraska", "South Dakota", "North Dakota"),
    PARTITION `p_oeste` VALUES IN ("Montana", "Idaho", "Wyoming", "Colorado", "New Mexico", "Arizona", "Utah", "Nevada"),
    PARTITION `p_pacifico` VALUES IN ("Washington", "Oregon", "California", "Alaska", "Hawaii")
)
DISTRIBUTED BY HASH(id)
PROPERTIES (
    "replication_num" = "3"
);


CREATE TABLE shoe_customers__primarykey__sparseindex_by_id__partitioned_by_state__distributed_by_id (
    id VARCHAR(36),
    state VARCHAR(25) NOT NULL,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(128),
    phone VARCHAR(12),
    street_address VARCHAR(48),
    zip_code VARCHAR(10),
    country VARCHAR(13),
    country_code CHAR(3)
)
PRIMARY KEY (id, state)
PARTITION BY LIST(state)
(
    PARTITION `p_nueva_inglaterra` VALUES IN ("Maine", "New Hampshire", "Vermont", "Massachusetts", "Rhode Island", "Connecticut"),
    PARTITION `p_medio_atlantico` VALUES IN ("New York", "Pennsylvania", "New Jersey", "Delaware", "Maryland", "District of Columbia"),
    PARTITION `p_sur_atlantico` VALUES IN ("Virginia", "West Virginia", "North Carolina", "South Carolina", "Georgia", "Florida"),
    PARTITION `p_sur_central` VALUES IN ("Kentucky", "Tennessee", "Alabama", "Mississippi", "Arkansas", "Louisiana", "Oklahoma", "Texas"),
    PARTITION `p_medio_oeste` VALUES IN ("Ohio", "Indiana", "Illinois", "Michigan", "Wisconsin"),
    PARTITION `p_noroeste_central` VALUES IN ("Minnesota", "Iowa", "Missouri", "Kansas", "Nebraska", "South Dakota", "North Dakota"),
    PARTITION `p_oeste` VALUES IN ("Montana", "Idaho", "Wyoming", "Colorado", "New Mexico", "Arizona", "Utah", "Nevada"),
    PARTITION `p_pacifico` VALUES IN ("Washington", "Oregon", "California", "Alaska", "Hawaii")
)
DISTRIBUTED BY HASH(id)
ORDER BY (id) 
PROPERTIES (
    "replication_num" = "3"
);

--------------------------------------------------------------------
-------------------- RUTINA TABLA SHOE CUSTOMERS -------------------
--------------------------------------------------------------------

CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_customers_1
 ON shoe_customers__duplicatekey__sparseindex_by_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
   "jsonpaths" = "[\"$.id\", \"$.first_name\", \"$.last_name\", \"$.email\", \"$.phone\", 
     \"$.street_address\", \"$.state\", \"$.zip_code\", \"$.country\", 
    \"$.country_code\"]"
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_customers",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_customers_2
 ON shoe_customers__duplicatekey__sparseindex_by_id__distributed_by_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
   "jsonpaths" = "[\"$.id\", \"$.first_name\", \"$.last_name\", \"$.email\", \"$.phone\", 
     \"$.street_address\", \"$.state\", \"$.zip_code\", \"$.country\", 
    \"$.country_code\"]"
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_customers",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);

CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_customers_3
 ON shoe_customers__duplicatekey__sparseindex_by_id__partitioned_by_state
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
   "jsonpaths" = "[\"$.id\", \"$.first_name\", \"$.last_name\", \"$.email\", \"$.phone\", 
     \"$.street_address\", \"$.state\", \"$.zip_code\", \"$.country\", 
    \"$.country_code\"]"
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_customers",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);

CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_customers_4
 ON shoe_customers__duplicatekey__sparseindex_by_id__partitioned_by_state__distributed_by_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
   "jsonpaths" = "[\"$.id\", \"$.first_name\", \"$.last_name\", \"$.email\", \"$.phone\", 
     \"$.street_address\", \"$.state\", \"$.zip_code\", \"$.country\", 
    \"$.country_code\"]"
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_customers",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);

CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_customers_5
 ON shoe_customers__duplicatekey__sparseindex_by_id__partitioned_by_state__bitmap_index__distributed_by_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
   "jsonpaths" = "[\"$.id\", \"$.first_name\", \"$.last_name\", \"$.email\", \"$.phone\", 
     \"$.street_address\", \"$.state\", \"$.zip_code\", \"$.country\", 
    \"$.country_code\"]"
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_customers",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_customers_6
 ON shoe_customers__primarykey__sparseindex_by_id__partitioned_by_state__distributed_by_id
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
   "jsonpaths" = "[\"$.id\", \"$.state\", \"$.first_name\", \"$.last_name\", \"$.email\", \"$.phone\", 
     \"$.street_address\", \"$.zip_code\", \"$.country\", 
    \"$.country_code\"]"
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_customers",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


--***********************************************************************--
--*********************** TABLA SHOE CLICKSTREAM ************************--
--***********************************************************************--


CREATE TABLE shoe_clickstream__duplicatekey__sparseindex_by_page_url (
    page_url VARCHAR(35),
    product_id VARCHAR(36),
    user_id VARCHAR(36),
    view_time INT,
    ip VARCHAR(16),
    ts BIGINT
)
DUPLICATE KEY (page_url)
PROPERTIES (
    "replication_num" = "1"
);


CREATE TABLE shoe_clickstream__duplicatekey__sparseindex_by_page_url__distributed_by_page_url (
    page_url VARCHAR(35),
    product_id VARCHAR(36),
    user_id VARCHAR(36),
    view_time INT,
    ip VARCHAR(16),
    ts BIGINT
)
DUPLICATE KEY (page_url)
DISTRIBUTED BY HASH(page_url)
PROPERTIES (
    "replication_num" = "3"
);



CREATE TABLE shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts(
    page_url VARCHAR(35),
    product_id VARCHAR(36),
    user_id VARCHAR(36),
    view_time INT,
    ip VARCHAR(16),
    ts BIGINT
)
DUPLICATE KEY (page_url)
PARTITION BY RANGE(ts) ( -- Para 60k unas 13 particiones 
    START ("1609457200000") END ("1609557200000") EVERY (21600000)    
)
DISTRIBUTED BY HASH(page_url)
PROPERTIES (
    "replication_num" = "1"
);


CREATE TABLE shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url (
    page_url VARCHAR(35),
    product_id VARCHAR(36),
    user_id VARCHAR(36),
    view_time INT,
    ip VARCHAR(16),
    ts BIGINT
)
DUPLICATE KEY (page_url)
PARTITION BY RANGE(ts) ( -- Para 60k unas 13 particiones 
    START ("1609457200000") END ("1609557200000") EVERY (21600000)    
)
DISTRIBUTED BY HASH(page_url)
PROPERTIES (
    "replication_num" = "3"
);

-- CÁLCULO DEL RANGO DE FECHAS
-- FECHA DE INICIO ESTÁ EN EL GIT DEL CONECTOR: 1609457200000
-- PASOS (ESTAN EN EL GIT TMBN) DE: 10000
-- NF: NUMERO DE FILAS QUE SE ESPERA TENER EN LA BD PARA HACER LAS PRUEBAS 
-- FECHA DE FIN: FECHA_INICIO + NF*PASO = 1609457200000 + 60K*10K 
-- INTERVALOS EN LA TABLA EVERY: Para cada 10K añadir 2horas (hecho por regla de 3, si para 60K son 12 horas cuanto es para 10K)


CREATE TABLE shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts__bitmap_index__distributed_by_page_url (
    page_url VARCHAR(35),
    product_id VARCHAR(36),
    user_id VARCHAR(36),
    view_time INT,
    ip VARCHAR(16),
    ts BIGINT,
    INDEX idx_page_url (page_url) USING BITMAP,
    INDEX idx_product_id (product_id) USING BITMAP,
    INDEX idx_user_id (user_id) USING BITMAP,
    INDEX idx_view_time (view_time) USING BITMAP,
    INDEX idx_ip (ip) USING BITMAP
)
DUPLICATE KEY (page_url)
PARTITION BY RANGE(ts) ( 
    START ("1609457200000") END ("1609557200000") EVERY (21600000)    
)
DISTRIBUTED BY HASH(page_url)
PROPERTIES (
    "replication_num" = "3"
);

CREATE TABLE shoe_clickstream__primarykey__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url (
    page_url VARCHAR(35),
    ts BIGINT,
    product_id VARCHAR(36),
    user_id VARCHAR(36),
    view_time INT,
    ip VARCHAR(16)
)
PRIMARY KEY (page_url, ts)
PARTITION BY RANGE(ts) ( -- Para 60k unas 13 particiones 
    START ("1609457200000") END ("1609557200000") EVERY (21600000)    
)
DISTRIBUTED BY HASH(page_url)
PROPERTIES (
    "replication_num" = "3"
);


--------------------------------------------------------------------
------------------- RUTINA TABLA SHOE CLICKSTREAM ------------------
--------------------------------------------------------------------


CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_clickstream_1 
    ON shoe_clickstream__duplicatekey__sparseindex_by_page_url
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.page_url\", \"$.product_id\", \"$.user_id\", \"$.view_time\", \"$.ip\", \"$.ts\"]"
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_clickstream",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_clickstream_2
    ON shoe_clickstream__duplicatekey__sparseindex_by_page_url__distributed_by_page_url
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.page_url\", \"$.product_id\", \"$.user_id\", \"$.view_time\", \"$.ip\", \"$.ts\"]"
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_clickstream",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_clickstream_3
    ON shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.page_url\", \"$.product_id\", \"$.user_id\", \"$.view_time\", \"$.ip\", \"$.ts\"]"
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_clickstream",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);

CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_clickstream_4
    ON shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.page_url\", \"$.product_id\", \"$.user_id\", \"$.view_time\", \"$.ip\", \"$.ts\"]"
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_clickstream",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);

CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_clickstream_5
    ON shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts__bitmap_index__distributed_by_page_url
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.page_url\", \"$.product_id\", \"$.user_id\", \"$.view_time\", \"$.ip\", \"$.ts\"]"
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_clickstream",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);


CREATE ROUTINE LOAD test.ROUTINE_LOAD_JOB_shoe_clickstream_6
    ON shoe_clickstream__primarykey__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url
PROPERTIES
(
    "desired_concurrent_number"="3",
    "strict_mode" = "false",
    "max_batch_interval" = "20",
    "max_batch_rows" = "300000",
    "max_batch_size" = "209715200",
    "format" = "json",
    "strip_outer_array" = "false",
    "jsonpaths" = "[\"$.page_url\", \"$.ts\", \"$.product_id\", \"$.user_id\", \"$.view_time\", \"$.ip\"]"
)
FROM KAFKA
(
    "kafka_broker_list" = "kafka:29092",
    "kafka_topic" = "shoe_clickstream",
    "property.group.id" = "group_shoes",
    "property.client.id" = "client_shoes",
    "property.kafka_default_offsets" = "OFFSET_BEGINNING"
);
