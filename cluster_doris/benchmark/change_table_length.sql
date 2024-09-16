
DROP TABLE test.shoes__temporal;
DROP TABLE test.shoe_orders__temporal;
DROP TABLE test.shoe_customers;
DROP TABLE test.shoe_clickstream;

------------- TABLA SHOES ---------------
CREATE TABLE test.shoes__temporal (
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


INSERT INTO test.shoes__temporal (id, brand, name, sale_price, rating)
SELECT id, brand, name, sale_price, rating
FROM test.shoes__duplicatekey__sparseindex_by_id
ORDER BY id
LIMIT 25000;

TRUNCATE TABLE test.shoes__duplicatekey__sparseindex_by_id;

INSERT INTO test.shoes__duplicatekey__sparseindex_by_id (id, brand, name, sale_price, rating)
SELECT id, brand, name, sale_price, rating
FROM test.shoes__temporal;


TRUNCATE TABLE test.shoes__duplicatekey__sparseindex_by_id__distributed_by_id;

INSERT INTO test.shoes__duplicatekey__sparseindex_by_id__distributed_by_id (id, brand, name, sale_price, rating)
SELECT id, brand, name, sale_price, rating
FROM test.shoes__temporal;


TRUNCATE TABLE test.shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand;

INSERT INTO test.shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand (id, brand, name, sale_price, rating)
SELECT id, brand, name, sale_price, rating
FROM test.shoes__temporal;


TRUNCATE TABLE test.shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__distributed_by_id;

INSERT INTO test.shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__distributed_by_id (id, brand, name, sale_price, rating)
SELECT id, brand, name, sale_price, rating
FROM test.shoes__temporal;

TRUNCATE TABLE test.shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter;

INSERT INTO test.shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter (id, brand, name, sale_price, rating)
SELECT id, brand, name, sale_price, rating
FROM test.shoes__temporal;


TRUNCATE TABLE test.shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter__distributed_by_id;

INSERT INTO test.shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter__distributed_by_id (id, brand, name, sale_price, rating)
SELECT id, brand, name, sale_price, rating
FROM test.shoes__temporal;



------------- TABLA SHOE_ORDERS ---------------

CREATE TABLE test.shoe_orders__temporal (
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

INSERT INTO test.shoe_orders__temporal (order_id, product_id, customer_id, ts)
SELECT order_id, product_id, customer_id, ts
FROM test.shoe_orders__duplicatekey__sparseindex_by_order_id
ORDER BY ts
LIMIT 25000;

TRUNCATE TABLE test.shoe_orders__duplicatekey__sparseindex_by_order_id;

INSERT INTO test.shoe_orders__duplicatekey__sparseindex_by_order_id (order_id, product_id, customer_id, ts)
SELECT order_id, product_id, customer_id, ts
FROM test.shoe_orders__temporal;


TRUNCATE TABLE test.shoe_orders__duplicatekey__sparseindex_by_order_id__distributed_by_order_id;

INSERT INTO test.shoe_orders__duplicatekey__sparseindex_by_order_id__distributed_by_order_id (order_id, product_id, customer_id, ts)
SELECT order_id, product_id, customer_id, ts
FROM test.shoe_orders__temporal;


------------- TABLA SHOE_CUSTOMERS ---------------

CREATE TABLE test.shoe_customers__temporal (
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


INSERT INTO test.shoe_customers__temporal (id, first_name, last_name, email, phone, street_address, state, zip_code, country, country_code)
SELECT *
FROM test.shoe_customers__duplicatekey__sparseindex_by_id
ORDER BY id
LIMIT 25000;


TRUNCATE TABLE test.shoe_customers__duplicatekey__sparseindex_by_id;

INSERT INTO test.shoe_customers__duplicatekey__sparseindex_by_id 
SELECT *
FROM test.shoe_customers__temporal;


TRUNCATE TABLE test.shoe_customers__duplicatekey__sparseindex_by_id__distributed_by_id;

INSERT INTO test.shoe_customers__duplicatekey__sparseindex_by_id__distributed_by_id 
SELECT *
FROM test.shoe_customers__temporal;


TRUNCATE TABLE test.shoe_customers__duplicatekey__sparseindex_by_id__partitioned_by_state;

INSERT INTO test.shoe_customers__duplicatekey__sparseindex_by_id__partitioned_by_state 
SELECT *
FROM test.shoe_customers__temporal;


TRUNCATE TABLE test.shoe_orders__duplicatekey__sparseindex_by_order_id__partitioned_by_ts;

INSERT INTO test.shoe_orders__duplicatekey__sparseindex_by_order_id__partitioned_by_ts 
SELECT *
FROM test.shoe_customers__temporal;


TRUNCATE TABLE test.shoe_orders__duplicatekey__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id;

INSERT INTO test.shoe_orders__duplicatekey__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id 
SELECT *
FROM test.shoe_customers__temporal;



------------- TABLA SHOE_CLICKSTREAM ---------------

CREATE TABLE test.shoe_clickstream__temporal (
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


INSERT INTO test.shoe_clickstream__temporal (page_url, product_id, user_id, view_time, ip, ts)
SELECT *
FROM test.shoe_clickstream__duplicatekey__sparseindex_by_page_url
ORDER BY ts
LIMIT 25000;


TRUNCATE TABLE test.shoe_clickstream__duplicatekey__sparseindex_by_page_url;

INSERT INTO test.shoe_clickstream__duplicatekey__sparseindex_by_page_url (page_url, product_id, user_id, view_time, ip, ts)
SELECT *
FROM test.shoe_clickstream__temporal;


TRUNCATE TABLE test.shoe_clickstream__duplicatekey__sparseindex_by_page_url__distributed_by_page_url;

INSERT INTO test.shoe_clickstream__duplicatekey__sparseindex_by_page_url__distributed_by_page_url (page_url, product_id, user_id, view_time, ip, ts)
SELECT *
FROM test.shoe_clickstream__temporal;


TRUNCATE TABLE test.shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts;

INSERT INTO test.shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts (page_url, product_id, user_id, view_time, ip, ts)
SELECT *
FROM test.shoe_clickstream__temporal;


TRUNCATE TABLE test.shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url;

INSERT INTO test.shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url (page_url, product_id, user_id, view_time, ip, ts)
SELECT *
FROM test.shoe_clickstream__temporal;


TRUNCATE TABLE test.shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts__bitmap_index__distributed_by_page_url;

INSERT INTO test.shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts__bitmap_index__distributed_by_page_url (page_url, product_id, user_id, view_time, ip, ts)
SELECT *
FROM test.shoe_clickstream__temporal;