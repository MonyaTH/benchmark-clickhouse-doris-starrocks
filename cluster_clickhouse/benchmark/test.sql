-- Tablas de shoes
SELECT COUNT(*) FROM test.shoes__sparseindex_by_id;
SELECT COUNT(*) FROM test.shoes__sparseindex_by_id__distributed_by_id;
SELECT COUNT(*) FROM test.shoes__sparseindex_by_id__partitioned_by_brand;
SELECT COUNT(*) FROM test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id;
SELECT COUNT(*) FROM test.shoes__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter;
SELECT COUNT(*) FROM test.shoes__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter__distributed_by_id;

-- Tablas de shoe_orders
SELECT COUNT(*) FROM test.shoe_orders__sparseindex_by_order_id;
SELECT COUNT(*) FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id;
SELECT COUNT(*) FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts;
SELECT COUNT(*) FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id;

-- Tablas de shoe_customers
SELECT COUNT(*) FROM test.shoe_customers__sparseindex_by_id;
SELECT COUNT(*) FROM test.shoe_customers__sparseindex_by_id__distributed_by_id;
SELECT COUNT(*) FROM test.shoe_customers__sparseindex_by_id__partitioned_by_state;
SELECT COUNT(*) FROM test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id;

-- Tablas de shoe_clickstream
SELECT COUNT(*) FROM test.shoe_clickstream__sparseindex_by_page_url;
SELECT COUNT(*) FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url;
SELECT COUNT(*) FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts;
SELECT COUNT(*) FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url;
