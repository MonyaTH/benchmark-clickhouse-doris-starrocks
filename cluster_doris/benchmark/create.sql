
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
DISTRIBUTED BY HASH(id)
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
PARTITION BY LIST(brand)
(
    PARTITION `p_Lebsack_Wiza_and_Jakubowski` VALUES IN ("Lebsack, Wiza and Jakubowski"),
    PARTITION `p_Torphy_Group` VALUES IN ("Torphy Group"),
    PARTITION `p_Will_Inc` VALUES IN ("Will Inc"),
    PARTITION `p_Huel_Ortiz` VALUES IN ("Huel-Ortiz"),
    PARTITION `p_Tremblay_LLC` VALUES IN ("Tremblay LLC"),
    PARTITION `p_Braun_Bruen` VALUES IN ("Braun-Bruen"),
    PARTITION `p_Tillman_Effertz_and_Nikolaus` VALUES IN ("Tillman, Effertz and Nikolaus"),
    PARTITION `p_Oberbrunner_Dietrich_and_Hickle` VALUES IN ("Oberbrunner, Dietrich and Hickle"),
    PARTITION `p_Grady_Group` VALUES IN ("Grady Group"),
    PARTITION `p_Ankunding_and_Sons` VALUES IN ("Ankunding and Sons"),
    PARTITION `p_Langworth_Little` VALUES IN ("Langworth-Little"),
    PARTITION `p_Macejkovic_Walter_and_Cummings` VALUES IN ("Macejkovic, Walter and Cummings"),
    PARTITION `p_Jones_Stokes` VALUES IN ("Jones-Stokes"),
    PARTITION `p_Beer_DAmore_and_Wintheiser` VALUES IN ("Beer, DAmore and Wintheiser"),
    PARTITION `p_Renner_DAmore` VALUES IN ("Renner-DAmore"),
    PARTITION `p_Okuneva_McCullough_and_Reynolds` VALUES IN ("Okuneva, McCullough and Reynolds"),
    PARTITION `p_Harvey_Kuhic` VALUES IN ("Harvey-Kuhic"),
    PARTITION `p_Williamson_Group` VALUES IN ("Williamson Group"),
    PARTITION `p_Gleichner_Buckridge` VALUES IN ("Gleichner-Buckridge"),
    PARTITION `p_Berge_Group` VALUES IN ("Berge Group")
)
DISTRIBUTED BY HASH(id)
PROPERTIES (
    "replication_num" = "1"
);



CREATE TABLE shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__distributed_by_id(
    id VARCHAR(36),
    brand VARCHAR(32) NOT NULL,
    name VARCHAR(24),
    sale_price FLOAT,
    rating FLOAT
)
DUPLICATE KEY(id)
PARTITION BY LIST(brand)
(
    PARTITION `p_Lebsack_Wiza_and_Jakubowski` VALUES IN ("Lebsack, Wiza and Jakubowski"),
    PARTITION `p_Torphy_Group` VALUES IN ("Torphy Group"),
    PARTITION `p_Will_Inc` VALUES IN ("Will Inc"),
    PARTITION `p_Huel_Ortiz` VALUES IN ("Huel-Ortiz"),
    PARTITION `p_Tremblay_LLC` VALUES IN ("Tremblay LLC"),
    PARTITION `p_Braun_Bruen` VALUES IN ("Braun-Bruen"),
    PARTITION `p_Tillman_Effertz_and_Nikolaus` VALUES IN ("Tillman, Effertz and Nikolaus"),
    PARTITION `p_Oberbrunner_Dietrich_and_Hickle` VALUES IN ("Oberbrunner, Dietrich and Hickle"),
    PARTITION `p_Grady_Group` VALUES IN ("Grady Group"),
    PARTITION `p_Ankunding_and_Sons` VALUES IN ("Ankunding and Sons"),
    PARTITION `p_Langworth_Little` VALUES IN ("Langworth-Little"),
    PARTITION `p_Macejkovic_Walter_and_Cummings` VALUES IN ("Macejkovic, Walter and Cummings"),
    PARTITION `p_Jones_Stokes` VALUES IN ("Jones-Stokes"),
    PARTITION `p_Beer_DAmore_and_Wintheiser` VALUES IN ("Beer, DAmore and Wintheiser"),
    PARTITION `p_Renner_DAmore` VALUES IN ("Renner-DAmore"),
    PARTITION `p_Okuneva_McCullough_and_Reynolds` VALUES IN ("Okuneva, McCullough and Reynolds"),
    PARTITION `p_Harvey_Kuhic` VALUES IN ("Harvey-Kuhic"),
    PARTITION `p_Williamson_Group` VALUES IN ("Williamson Group"),
    PARTITION `p_Gleichner_Buckridge` VALUES IN ("Gleichner-Buckridge"),
    PARTITION `p_Berge_Group` VALUES IN ("Berge Group")
)
DISTRIBUTED BY HASH(id)
PROPERTIES (
    "replication_num" = "3"
);


CREATE TABLE shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter(
    id VARCHAR(36),
    brand VARCHAR(32) NOT NULL,
    name VARCHAR(24),
    sale_price FLOAT,
    rating FLOAT,
    INDEX idx_name (`name`) USING NGRAM_BF PROPERTIES("gram_size"="4", "bf_size"="256"),
    INDEX idx_id (`id`) USING NGRAM_BF PROPERTIES("gram_size"="4", "bf_size"="256")
)
DUPLICATE KEY(id)
PARTITION BY LIST(brand)
(
    PARTITION `p_Lebsack_Wiza_and_Jakubowski` VALUES IN ("Lebsack, Wiza and Jakubowski"),
    PARTITION `p_Torphy_Group` VALUES IN ("Torphy Group"),
    PARTITION `p_Will_Inc` VALUES IN ("Will Inc"),
    PARTITION `p_Huel_Ortiz` VALUES IN ("Huel-Ortiz"),
    PARTITION `p_Tremblay_LLC` VALUES IN ("Tremblay LLC"),
    PARTITION `p_Braun_Bruen` VALUES IN ("Braun-Bruen"),
    PARTITION `p_Tillman_Effertz_and_Nikolaus` VALUES IN ("Tillman, Effertz and Nikolaus"),
    PARTITION `p_Oberbrunner_Dietrich_and_Hickle` VALUES IN ("Oberbrunner, Dietrich and Hickle"),
    PARTITION `p_Grady_Group` VALUES IN ("Grady Group"),
    PARTITION `p_Ankunding_and_Sons` VALUES IN ("Ankunding and Sons"),
    PARTITION `p_Langworth_Little` VALUES IN ("Langworth-Little"),
    PARTITION `p_Macejkovic_Walter_and_Cummings` VALUES IN ("Macejkovic, Walter and Cummings"),
    PARTITION `p_Jones_Stokes` VALUES IN ("Jones-Stokes"),
    PARTITION `p_Beer_DAmore_and_Wintheiser` VALUES IN ("Beer, DAmore and Wintheiser"),
    PARTITION `p_Renner_DAmore` VALUES IN ("Renner-DAmore"),
    PARTITION `p_Okuneva_McCullough_and_Reynolds` VALUES IN ("Okuneva, McCullough and Reynolds"),
    PARTITION `p_Harvey_Kuhic` VALUES IN ("Harvey-Kuhic"),
    PARTITION `p_Williamson_Group` VALUES IN ("Williamson Group"),
    PARTITION `p_Gleichner_Buckridge` VALUES IN ("Gleichner-Buckridge"),
    PARTITION `p_Berge_Group` VALUES IN ("Berge Group")
)
DISTRIBUTED BY HASH(id)
PROPERTIES (
    "replication_num" = "1"
);



CREATE TABLE shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter__distributed_by_id(
    id VARCHAR(36),
    brand VARCHAR(32) NOT NULL,
    name VARCHAR(24),
    sale_price FLOAT,
    rating FLOAT,
    INDEX idx_id (`id`) USING NGRAM_BF PROPERTIES("gram_size"="4", "bf_size"="256")
    -- INDEX idx_name (`name`) USING NGRAM_BF PROPERTIES("gram_size"="4", "bf_size"="256") 
)
DUPLICATE KEY(id)
PARTITION BY LIST(brand)
(
    PARTITION `p_Lebsack_Wiza_and_Jakubowski` VALUES IN ("Lebsack, Wiza and Jakubowski"),
    PARTITION `p_Torphy_Group` VALUES IN ("Torphy Group"),
    PARTITION `p_Will_Inc` VALUES IN ("Will Inc"),
    PARTITION `p_Huel_Ortiz` VALUES IN ("Huel-Ortiz"),
    PARTITION `p_Tremblay_LLC` VALUES IN ("Tremblay LLC"),
    PARTITION `p_Braun_Bruen` VALUES IN ("Braun-Bruen"),
    PARTITION `p_Tillman_Effertz_and_Nikolaus` VALUES IN ("Tillman, Effertz and Nikolaus"),
    PARTITION `p_Oberbrunner_Dietrich_and_Hickle` VALUES IN ("Oberbrunner, Dietrich and Hickle"),
    PARTITION `p_Grady_Group` VALUES IN ("Grady Group"),
    PARTITION `p_Ankunding_and_Sons` VALUES IN ("Ankunding and Sons"),
    PARTITION `p_Langworth_Little` VALUES IN ("Langworth-Little"),
    PARTITION `p_Macejkovic_Walter_and_Cummings` VALUES IN ("Macejkovic, Walter and Cummings"),
    PARTITION `p_Jones_Stokes` VALUES IN ("Jones-Stokes"),
    PARTITION `p_Beer_DAmore_and_Wintheiser` VALUES IN ("Beer, DAmore and Wintheiser"),
    PARTITION `p_Renner_DAmore` VALUES IN ("Renner-DAmore"),
    PARTITION `p_Okuneva_McCullough_and_Reynolds` VALUES IN ("Okuneva, McCullough and Reynolds"),
    PARTITION `p_Harvey_Kuhic` VALUES IN ("Harvey-Kuhic"),
    PARTITION `p_Williamson_Group` VALUES IN ("Williamson Group"),
    PARTITION `p_Gleichner_Buckridge` VALUES IN ("Gleichner-Buckridge"),
    PARTITION `p_Berge_Group` VALUES IN ("Berge Group")
)
DISTRIBUTED BY HASH(id)
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
DISTRIBUTED BY HASH(order_id)
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
    ts BIGINT
)
DUPLICATE KEY (order_id)
PARTITION BY RANGE (ts) (
PARTITION p1 VALUES LESS THAN ("1619827200000"),
PARTITION p2 VALUES LESS THAN ("1630195200000"),
PARTITION p3 VALUES LESS THAN ("1640563200000"),
PARTITION p4 VALUES LESS THAN ("1650931200000"),
PARTITION p5 VALUES LESS THAN ("1661299200000"),
PARTITION p6 VALUES LESS THAN ("1671667200000"),
PARTITION p7 VALUES LESS THAN ("1682035200000"),
PARTITION p8 VALUES LESS THAN ("1692403200000"),
PARTITION p9 VALUES LESS THAN ("1702771200000"),
PARTITION p10 VALUES LESS THAN ("1713139200000"),
PARTITION p11 VALUES LESS THAN ("1723507200000"),
PARTITION p12 VALUES LESS THAN ("1733875200000"),
PARTITION p13 VALUES LESS THAN ("1744243200000"),
PARTITION p14 VALUES LESS THAN ("1754611200000"),
PARTITION p15 VALUES LESS THAN ("1764979200000"),
PARTITION p16 VALUES LESS THAN ("1775347200000"),
PARTITION p17 VALUES LESS THAN ("1785715200000"),
PARTITION p18 VALUES LESS THAN ("1796083200000"),
PARTITION p19 VALUES LESS THAN ("1806451200000"),
PARTITION p20 VALUES LESS THAN ("1816819200000"),
PARTITION p21 VALUES LESS THAN ("1827187200000"),
PARTITION p22 VALUES LESS THAN ("1837555200000"),
PARTITION p23 VALUES LESS THAN ("1847923200000"),
PARTITION p24 VALUES LESS THAN ("1858291200000"),
PARTITION p25 VALUES LESS THAN ("1868659200000"),
PARTITION p26 VALUES LESS THAN ("1879027200000"),
PARTITION p27 VALUES LESS THAN ("1889395200000"),
PARTITION p28 VALUES LESS THAN ("1899763200000"),
PARTITION p29 VALUES LESS THAN ("1910131200000"),
PARTITION p30 VALUES LESS THAN ("1920499200000"),
PARTITION p31 VALUES LESS THAN ("1930867200000"),
PARTITION p32 VALUES LESS THAN ("1941235200000"),
PARTITION p33 VALUES LESS THAN ("1951603200000"),
PARTITION p34 VALUES LESS THAN ("1961971200000"),
PARTITION p35 VALUES LESS THAN ("1972339200000"),
PARTITION p36 VALUES LESS THAN ("1982707200000"),
PARTITION p37 VALUES LESS THAN ("1993075200000"),
PARTITION p38 VALUES LESS THAN ("2003443200000"),
PARTITION p39 VALUES LESS THAN ("2013811200000"),
PARTITION p40 VALUES LESS THAN ("2024179200000"),
PARTITION p41 VALUES LESS THAN ("2034547200000"),
PARTITION p42 VALUES LESS THAN ("2044915200000"),
PARTITION p43 VALUES LESS THAN ("2055283200000"),
PARTITION p44 VALUES LESS THAN ("2065651200000"),
PARTITION p45 VALUES LESS THAN ("2076019200000"),
PARTITION p46 VALUES LESS THAN ("2086387200000"),
PARTITION p47 VALUES LESS THAN ("2096755200000"),
PARTITION p48 VALUES LESS THAN ("2109459200000")

)
DISTRIBUTED BY HASH(order_id) 
PROPERTIES (
    "replication_num" = "1"
);


CREATE TABLE shoe_orders__duplicatekey__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id (
    order_id INT,
    product_id VARCHAR(36),
    customer_id VARCHAR(36),
    ts BIGINT
)
DUPLICATE KEY (order_id)
PARTITION BY RANGE (ts) (
PARTITION p1 VALUES LESS THAN ("1619827200000"),
PARTITION p2 VALUES LESS THAN ("1630195200000"),
PARTITION p3 VALUES LESS THAN ("1640563200000"),
PARTITION p4 VALUES LESS THAN ("1650931200000"),
PARTITION p5 VALUES LESS THAN ("1661299200000"),
PARTITION p6 VALUES LESS THAN ("1671667200000"),
PARTITION p7 VALUES LESS THAN ("1682035200000"),
PARTITION p8 VALUES LESS THAN ("1692403200000"),
PARTITION p9 VALUES LESS THAN ("1702771200000"),
PARTITION p10 VALUES LESS THAN ("1713139200000"),
PARTITION p11 VALUES LESS THAN ("1723507200000"),
PARTITION p12 VALUES LESS THAN ("1733875200000"),
PARTITION p13 VALUES LESS THAN ("1744243200000"),
PARTITION p14 VALUES LESS THAN ("1754611200000"),
PARTITION p15 VALUES LESS THAN ("1764979200000"),
PARTITION p16 VALUES LESS THAN ("1775347200000"),
PARTITION p17 VALUES LESS THAN ("1785715200000"),
PARTITION p18 VALUES LESS THAN ("1796083200000"),
PARTITION p19 VALUES LESS THAN ("1806451200000"),
PARTITION p20 VALUES LESS THAN ("1816819200000"),
PARTITION p21 VALUES LESS THAN ("1827187200000"),
PARTITION p22 VALUES LESS THAN ("1837555200000"),
PARTITION p23 VALUES LESS THAN ("1847923200000"),
PARTITION p24 VALUES LESS THAN ("1858291200000"),
PARTITION p25 VALUES LESS THAN ("1868659200000"),
PARTITION p26 VALUES LESS THAN ("1879027200000"),
PARTITION p27 VALUES LESS THAN ("1889395200000"),
PARTITION p28 VALUES LESS THAN ("1899763200000"),
PARTITION p29 VALUES LESS THAN ("1910131200000"),
PARTITION p30 VALUES LESS THAN ("1920499200000"),
PARTITION p31 VALUES LESS THAN ("1930867200000"),
PARTITION p32 VALUES LESS THAN ("1941235200000"),
PARTITION p33 VALUES LESS THAN ("1951603200000"),
PARTITION p34 VALUES LESS THAN ("1961971200000"),
PARTITION p35 VALUES LESS THAN ("1972339200000"),
PARTITION p36 VALUES LESS THAN ("1982707200000"),
PARTITION p37 VALUES LESS THAN ("1993075200000"),
PARTITION p38 VALUES LESS THAN ("2003443200000"),
PARTITION p39 VALUES LESS THAN ("2013811200000"),
PARTITION p40 VALUES LESS THAN ("2024179200000"),
PARTITION p41 VALUES LESS THAN ("2034547200000"),
PARTITION p42 VALUES LESS THAN ("2044915200000"),
PARTITION p43 VALUES LESS THAN ("2055283200000"),
PARTITION p44 VALUES LESS THAN ("2065651200000"),
PARTITION p45 VALUES LESS THAN ("2076019200000"),
PARTITION p46 VALUES LESS THAN ("2086387200000"),
PARTITION p47 VALUES LESS THAN ("2096755200000"),
PARTITION p48 VALUES LESS THAN ("2109459200000")

)
DISTRIBUTED BY HASH(order_id) 
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
    "jsonpaths" = "[\"$.order_id\", \"$.product_id\",\"$.customer_id\", \"$.ts\"]"  
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
    "jsonpaths" = "[\"$.order_id\", \"$.product_id\",\"$.customer_id\", \"$.ts\"]"  
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
    "jsonpaths" = "[\"$.order_id\", \"$.product_id\",\"$.customer_id\", \"$.ts\"]"  
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
    "jsonpaths" = "[\"$.order_id\", \"$.product_id\",\"$.customer_id\", \"$.ts\"]"  
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
DISTRIBUTED BY HASH(id)
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
DISTRIBUTED BY HASH(id)
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
DISTRIBUTED BY HASH(page_url)
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



CREATE TABLE shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts (
    page_url VARCHAR(35),
    product_id VARCHAR(36),
    user_id VARCHAR(36),
    view_time INT,
    ip VARCHAR(16),
    ts BIGINT
)
DUPLICATE KEY (page_url)
PARTITION BY RANGE(ts) (
PARTITION p1 VALUES LESS THAN ("1610494000000"),
PARTITION p2 VALUES LESS THAN ("1611530800000"),
PARTITION p3 VALUES LESS THAN ("1612567600000"),
PARTITION p4 VALUES LESS THAN ("1613604400000"),
PARTITION p5 VALUES LESS THAN ("1614641200000"),
PARTITION p6 VALUES LESS THAN ("1615678000000"),
PARTITION p7 VALUES LESS THAN ("1616714800000"),
PARTITION p8 VALUES LESS THAN ("1617751600000"),
PARTITION p9 VALUES LESS THAN ("1618788400000"),
PARTITION p10 VALUES LESS THAN ("1619825200000"),
PARTITION p11 VALUES LESS THAN ("1620862000000"),
PARTITION p12 VALUES LESS THAN ("1621898800000"),
PARTITION p13 VALUES LESS THAN ("1622935600000"),
PARTITION p14 VALUES LESS THAN ("1623972400000"),
PARTITION p15 VALUES LESS THAN ("1625009200000"),
PARTITION p16 VALUES LESS THAN ("1626046000000"),
PARTITION p17 VALUES LESS THAN ("1627082800000"),
PARTITION p18 VALUES LESS THAN ("1628119600000"),
PARTITION p19 VALUES LESS THAN ("1629156400000"),
PARTITION p20 VALUES LESS THAN ("1630193200000"),
PARTITION p21 VALUES LESS THAN ("1631230000000"),
PARTITION p22 VALUES LESS THAN ("1632266800000"),
PARTITION p23 VALUES LESS THAN ("1633303600000"),
PARTITION p24 VALUES LESS THAN ("1634340400000"),
PARTITION p25 VALUES LESS THAN ("1635377200000"),
PARTITION p26 VALUES LESS THAN ("1636414000000"),
PARTITION p27 VALUES LESS THAN ("1637450800000"),
PARTITION p28 VALUES LESS THAN ("1638487600000"),
PARTITION p29 VALUES LESS THAN ("1639524400000"),
PARTITION p30 VALUES LESS THAN ("1640561200000"),
PARTITION p31 VALUES LESS THAN ("1641598000000"),
PARTITION p32 VALUES LESS THAN ("1642634800000"),
PARTITION p33 VALUES LESS THAN ("1643671600000"),
PARTITION p34 VALUES LESS THAN ("1644708400000"),
PARTITION p35 VALUES LESS THAN ("1645745200000"),
PARTITION p36 VALUES LESS THAN ("1646782000000"),
PARTITION p37 VALUES LESS THAN ("1647818800000"),
PARTITION p38 VALUES LESS THAN ("1648855600000"),
PARTITION p39 VALUES LESS THAN ("1649892400000"),
PARTITION p40 VALUES LESS THAN ("1650929200000"),
PARTITION p41 VALUES LESS THAN ("1651966000000"),
PARTITION p42 VALUES LESS THAN ("1653002800000"),
PARTITION p43 VALUES LESS THAN ("1654039600000"),
PARTITION p44 VALUES LESS THAN ("1655076400000"),
PARTITION p45 VALUES LESS THAN ("1656113200000"),
PARTITION p46 VALUES LESS THAN ("1657150000000"),
PARTITION p47 VALUES LESS THAN ("1658186800000"),
PARTITION p48 VALUES LESS THAN ("1659457200000")

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
PARTITION BY RANGE(ts) (
PARTITION p1 VALUES LESS THAN ("1610494000000"),
PARTITION p2 VALUES LESS THAN ("1611530800000"),
PARTITION p3 VALUES LESS THAN ("1612567600000"),
PARTITION p4 VALUES LESS THAN ("1613604400000"),
PARTITION p5 VALUES LESS THAN ("1614641200000"),
PARTITION p6 VALUES LESS THAN ("1615678000000"),
PARTITION p7 VALUES LESS THAN ("1616714800000"),
PARTITION p8 VALUES LESS THAN ("1617751600000"),
PARTITION p9 VALUES LESS THAN ("1618788400000"),
PARTITION p10 VALUES LESS THAN ("1619825200000"),
PARTITION p11 VALUES LESS THAN ("1620862000000"),
PARTITION p12 VALUES LESS THAN ("1621898800000"),
PARTITION p13 VALUES LESS THAN ("1622935600000"),
PARTITION p14 VALUES LESS THAN ("1623972400000"),
PARTITION p15 VALUES LESS THAN ("1625009200000"),
PARTITION p16 VALUES LESS THAN ("1626046000000"),
PARTITION p17 VALUES LESS THAN ("1627082800000"),
PARTITION p18 VALUES LESS THAN ("1628119600000"),
PARTITION p19 VALUES LESS THAN ("1629156400000"),
PARTITION p20 VALUES LESS THAN ("1630193200000"),
PARTITION p21 VALUES LESS THAN ("1631230000000"),
PARTITION p22 VALUES LESS THAN ("1632266800000"),
PARTITION p23 VALUES LESS THAN ("1633303600000"),
PARTITION p24 VALUES LESS THAN ("1634340400000"),
PARTITION p25 VALUES LESS THAN ("1635377200000"),
PARTITION p26 VALUES LESS THAN ("1636414000000"),
PARTITION p27 VALUES LESS THAN ("1637450800000"),
PARTITION p28 VALUES LESS THAN ("1638487600000"),
PARTITION p29 VALUES LESS THAN ("1639524400000"),
PARTITION p30 VALUES LESS THAN ("1640561200000"),
PARTITION p31 VALUES LESS THAN ("1641598000000"),
PARTITION p32 VALUES LESS THAN ("1642634800000"),
PARTITION p33 VALUES LESS THAN ("1643671600000"),
PARTITION p34 VALUES LESS THAN ("1644708400000"),
PARTITION p35 VALUES LESS THAN ("1645745200000"),
PARTITION p36 VALUES LESS THAN ("1646782000000"),
PARTITION p37 VALUES LESS THAN ("1647818800000"),
PARTITION p38 VALUES LESS THAN ("1648855600000"),
PARTITION p39 VALUES LESS THAN ("1649892400000"),
PARTITION p40 VALUES LESS THAN ("1650929200000"),
PARTITION p41 VALUES LESS THAN ("1651966000000"),
PARTITION p42 VALUES LESS THAN ("1653002800000"),
PARTITION p43 VALUES LESS THAN ("1654039600000"),
PARTITION p44 VALUES LESS THAN ("1655076400000"),
PARTITION p45 VALUES LESS THAN ("1656113200000"),
PARTITION p46 VALUES LESS THAN ("1657150000000"),
PARTITION p47 VALUES LESS THAN ("1658186800000"),
PARTITION p48 VALUES LESS THAN ("1659457200000")
)
DISTRIBUTED BY HASH(page_url)
PROPERTIES (
    "replication_num" = "3"
);



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
PARTITION p1 VALUES LESS THAN ("1610494000000"),
PARTITION p2 VALUES LESS THAN ("1611530800000"),
PARTITION p3 VALUES LESS THAN ("1612567600000"),
PARTITION p4 VALUES LESS THAN ("1613604400000"),
PARTITION p5 VALUES LESS THAN ("1614641200000"),
PARTITION p6 VALUES LESS THAN ("1615678000000"),
PARTITION p7 VALUES LESS THAN ("1616714800000"),
PARTITION p8 VALUES LESS THAN ("1617751600000"),
PARTITION p9 VALUES LESS THAN ("1618788400000"),
PARTITION p10 VALUES LESS THAN ("1619825200000"),
PARTITION p11 VALUES LESS THAN ("1620862000000"),
PARTITION p12 VALUES LESS THAN ("1621898800000"),
PARTITION p13 VALUES LESS THAN ("1622935600000"),
PARTITION p14 VALUES LESS THAN ("1623972400000"),
PARTITION p15 VALUES LESS THAN ("1625009200000"),
PARTITION p16 VALUES LESS THAN ("1626046000000"),
PARTITION p17 VALUES LESS THAN ("1627082800000"),
PARTITION p18 VALUES LESS THAN ("1628119600000"),
PARTITION p19 VALUES LESS THAN ("1629156400000"),
PARTITION p20 VALUES LESS THAN ("1630193200000"),
PARTITION p21 VALUES LESS THAN ("1631230000000"),
PARTITION p22 VALUES LESS THAN ("1632266800000"),
PARTITION p23 VALUES LESS THAN ("1633303600000"),
PARTITION p24 VALUES LESS THAN ("1634340400000"),
PARTITION p25 VALUES LESS THAN ("1635377200000"),
PARTITION p26 VALUES LESS THAN ("1636414000000"),
PARTITION p27 VALUES LESS THAN ("1637450800000"),
PARTITION p28 VALUES LESS THAN ("1638487600000"),
PARTITION p29 VALUES LESS THAN ("1639524400000"),
PARTITION p30 VALUES LESS THAN ("1640561200000"),
PARTITION p31 VALUES LESS THAN ("1641598000000"),
PARTITION p32 VALUES LESS THAN ("1642634800000"),
PARTITION p33 VALUES LESS THAN ("1643671600000"),
PARTITION p34 VALUES LESS THAN ("1644708400000"),
PARTITION p35 VALUES LESS THAN ("1645745200000"),
PARTITION p36 VALUES LESS THAN ("1646782000000"),
PARTITION p37 VALUES LESS THAN ("1647818800000"),
PARTITION p38 VALUES LESS THAN ("1648855600000"),
PARTITION p39 VALUES LESS THAN ("1649892400000"),
PARTITION p40 VALUES LESS THAN ("1650929200000"),
PARTITION p41 VALUES LESS THAN ("1651966000000"),
PARTITION p42 VALUES LESS THAN ("1653002800000"),
PARTITION p43 VALUES LESS THAN ("1654039600000"),
PARTITION p44 VALUES LESS THAN ("1655076400000"),
PARTITION p45 VALUES LESS THAN ("1656113200000"),
PARTITION p46 VALUES LESS THAN ("1657150000000"),
PARTITION p47 VALUES LESS THAN ("1658186800000"),
PARTITION p48 VALUES LESS THAN ("1659457200000")

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
