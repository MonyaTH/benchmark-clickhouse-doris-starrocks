SELECT COUNT(*) AS '1)' FROM shoes__duplicatekey__sparseindex_by_id; 
SELECT COUNT(*) AS '2)' FROM shoes__duplicatekey__sparseindex_by_id__distributed_by_id;   
SELECT COUNT(*) AS '3)' FROM shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand;  
SELECT COUNT(*) AS '4)' FROM shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__distributed_by_id;  
SELECT COUNT(*) AS '5)' FROM shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter;   
SELECT COUNT(*) AS '6)' FROM shoes__duplicatekey__sparseindex_by_id__partitioned_by_brand__ngram_bloom_filter__distributed_by_id;   
SELECT COUNT(*) AS '7)' FROM shoes__primarykey__sparseindex_by_id__partitioned_by_brand__distributed_by_id;

SELECT COUNT(*) AS '8)' FROM shoe_orders__duplicatekey__sparseindex_by_order_id; 
SELECT COUNT(*) AS '9)' FROM shoe_orders__duplicatekey__sparseindex_by_order_id__distributed_by_order_id;
SELECT COUNT(*) AS '10)' FROM shoe_orders__duplicatekey__sparseindex_by_order_id__partitioned_by_ts;
SELECT COUNT(*) AS '11)' FROM shoe_orders__duplicatekey__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id;
SELECT COUNT(*) AS '12)' FROM shoe_orders__primarykey__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id; 

SELECT COUNT(*) AS '13)' FROM shoe_customers__duplicatekey__sparseindex_by_id;    
SELECT COUNT(*) AS '14)' FROM shoe_customers__duplicatekey__sparseindex_by_id__distributed_by_id;
SELECT COUNT(*) AS '15)' FROM shoe_customers__duplicatekey__sparseindex_by_id__partitioned_by_state;  
SELECT COUNT(*) AS '16)' FROM shoe_customers__duplicatekey__sparseindex_by_id__partitioned_by_state__distributed_by_id;  
SELECT COUNT(*) AS '17)' FROM shoe_customers__duplicatekey__sparseindex_by_id__partitioned_by_state__bitmap_index__distributed_by_id;
SELECT COUNT(*) AS '18)' FROM shoe_customers__primarykey__sparseindex_by_id__partitioned_by_state__distributed_by_id; 

SELECT COUNT(*) AS '19)' FROM shoe_clickstream__duplicatekey__sparseindex_by_page_url;     
SELECT COUNT(*) AS '20)' FROM shoe_clickstream__duplicatekey__sparseindex_by_page_url__distributed_by_page_url; 
SELECT COUNT(*) AS '21)' FROM shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts;   
SELECT COUNT(*) AS '22)' FROM shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url;   
SELECT COUNT(*) AS '23)' FROM shoe_clickstream__duplicatekey__sparseindex_by_page_url__partitioned_by_ts__bitmap_index__distributed_by_page_url; 
SELECT COUNT(*) AS '24)' FROM shoe_clickstream__primarykey__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url;     

