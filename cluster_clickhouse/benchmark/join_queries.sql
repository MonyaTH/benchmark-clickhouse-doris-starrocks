-- INNER JOIN
-- OUTER JOIN (LEFT JOIN)
-- CROSS JOIN
-- SEMI JOIN
-- ANTI JOIN (LEFT JOIN)
-- ANY JOIN (LEFT JOIN)
---
-- shoes - shoe_orders 
IJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o INNER JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id;
OJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o LEFT JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id;
CJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o CROSS JOIN test.shoes__sparseindex_by_id AS s WHERE o.product_id = s.id;
SJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o LEFT SEMI JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id;
ATJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o LEFT ANTI JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id;
--
IJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL INNER JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id;
OJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL LEFT JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id;
CJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL CROSS JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s WHERE o.product_id = s.id;
SJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL LEFT SEMI JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id;
ATJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL LEFT ANTI JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id;
--
IJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o INNER JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id;
OJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o LEFT JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id;
CJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o CROSS JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s WHERE o.product_id = s.id;
SJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o LEFT SEMI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id;
ATJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o LEFT ANTI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id;
--
IJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL INNER JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id;
OJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL LEFT JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id;
CJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL CROSS JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s WHERE o.product_id = s.id;
SJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL LEFT SEMI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id;
ATJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL LEFT ANTI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id;
--
-- shoe_orders - shoe_customers 
IJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o INNER JOIN test.shoe_customers__sparseindex_by_id AS c ON o.customer_id = c.id;
OJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o LEFT JOIN test.shoe_customers__sparseindex_by_id AS c ON o.customer_id = c.id;
CJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o CROSS JOIN test.shoe_customers__sparseindex_by_id AS c WHERE o.customer_id = c.id;
SJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id AS c ON o.customer_id = c.id;
ATJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id AS c ON o.customer_id = c.id;
--
IJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL INNER JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.customer_id = c.id;
OJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL LEFT JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.customer_id = c.id;
CJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL CROSS JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c WHERE o.customer_id = c.id;
SJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.customer_id = c.id;
ATJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.customer_id = c.id;
--
IJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o INNER JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.customer_id = c.id;
OJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o LEFT JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.customer_id = c.id;
CJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o CROSS JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c WHERE o.customer_id = c.id;
SJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.customer_id = c.id;
ATJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.customer_id = c.id;
--
IJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL INNER JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.customer_id = c.id;
OJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL LEFT JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.customer_id = c.id;
CJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL CROSS JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c WHERE o.customer_id = c.id;
SJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.customer_id = c.id;
ATJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.customer_id = c.id;
--
-- shoe_clickstream - shoes
IJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o INNER JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id;
OJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o LEFT JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id;
CJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o CROSS JOIN test.shoes__sparseindex_by_id AS s WHERE o.product_id = s.id;
SJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o LEFT SEMI JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id;
ATJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o LEFT ANTI JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id;
--
IJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL INNER JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id;
OJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL LEFT JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id;
CJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL CROSS JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s WHERE o.product_id = s.id;
SJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL LEFT SEMI JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id;
ATJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL LEFT ANTI JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id;
--
IJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o INNER JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id;
OJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o LEFT JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id;
CJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o CROSS JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s WHERE o.product_id = s.id;
SJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o LEFT SEMI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id;
ATJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o LEFT ANTI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id;
--
IJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL INNER JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id;
OJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL LEFT JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id;
CJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL CROSS JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s WHERE o.product_id = s.id;
SJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL LEFT SEMI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id;
ATJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL LEFT ANTI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id;
--
-- shoe_clickstream - shoe_customers
IJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o INNER JOIN test.shoe_customers__sparseindex_by_id AS c ON o.user_id = c.id;
OJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o LEFT JOIN test.shoe_customers__sparseindex_by_id AS c ON o.user_id = c.id;
CJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o CROSS JOIN test.shoe_customers__sparseindex_by_id AS c WHERE o.user_id = c.id;
SJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id AS c ON o.user_id = c.id;
ATJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id AS c ON o.user_id = c.id;
--
IJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL INNER JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.user_id = c.id;
OJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL LEFT JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.user_id = c.id;
CJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL CROSS JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c WHERE o.user_id = c.id;
SJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.user_id = c.id;
ATJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.user_id = c.id;
--
IJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o INNER JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.user_id = c.id;
OJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o LEFT JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.user_id = c.id;
CJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o CROSS JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c WHERE o.user_id = c.id;
SJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.user_id = c.id;
ATJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.user_id = c.id;
--
IJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL INNER JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.user_id = c.id;
OJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL LEFT JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.user_id = c.id;
CJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL CROSS JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c WHERE o.user_id = c.id;
SJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.user_id = c.id;
ATJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.user_id = c.id;
--
-- shoe_orders - shoes - shoe_customers
IJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o INNER JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id INNER JOIN test.shoe_customers__sparseindex_by_id AS c ON o.customer_id = c.id;
OJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o LEFT JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id LEFT JOIN test.shoe_customers__sparseindex_by_id AS c ON o.customer_id = c.id;
CJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o CROSS JOIN test.shoes__sparseindex_by_id AS s CROSS JOIN test.shoe_customers__sparseindex_by_id AS c WHERE o.product_id = s.id AND o.customer_id = c.id;
SJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o LEFT SEMI JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id AS c ON o.customer_id = c.id;
ATJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id AS o LEFT ANTI JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id AS c ON o.customer_id = c.id;
--
IJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL INNER JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id GLOBAL INNER JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.customer_id = c.id;
OJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL LEFT JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id GLOBAL LEFT JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.customer_id = c.id;
CJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL CROSS JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s GLOBAL CROSS JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c WHERE o.product_id = s.id AND o.customer_id = c.id;
SJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL LEFT SEMI JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id GLOBAL LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.customer_id = c.id;
ATJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS o GLOBAL LEFT ANTI JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id GLOBAL LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.customer_id = c.id;
--
IJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o INNER JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id INNER JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.customer_id = c.id;
OJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o LEFT JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id LEFT JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.customer_id = c.id;
CJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o CROSS JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s CROSS JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c WHERE o.product_id = s.id AND o.customer_id = c.id;
SJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o LEFT SEMI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.customer_id = c.id;
ATJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS o LEFT ANTI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.customer_id = c.id;
--
IJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL INNER JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id GLOBAL INNER JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.customer_id = c.id;
OJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL LEFT JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id GLOBAL LEFT JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.customer_id = c.id;
CJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL CROSS JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s GLOBAL CROSS JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c WHERE o.product_id = s.id AND o.customer_id = c.id;
SJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL LEFT SEMI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id GLOBAL LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.customer_id = c.id;
ATJ,SELECT o.order_id, o.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS o GLOBAL LEFT ANTI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id GLOBAL LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.customer_id = c.id;
--
-- shoe_clickstream - shoes - shoe_customers
IJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o INNER JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id INNER JOIN test.shoe_customers__sparseindex_by_id AS c ON o.user_id = c.id;
OJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o LEFT JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id LEFT JOIN test.shoe_customers__sparseindex_by_id AS c ON o.user_id = c.id;
CJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o CROSS JOIN test.shoes__sparseindex_by_id AS s CROSS JOIN test.shoe_customers__sparseindex_by_id AS c WHERE o.product_id = s.id AND o.user_id = c.id;
SJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o LEFT SEMI JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id AS c ON o.user_id = c.id;
ATJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url AS o LEFT ANTI JOIN test.shoes__sparseindex_by_id AS s ON o.product_id = s.id LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id AS c ON o.user_id = c.id;
--
IJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL INNER JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id GLOBAL INNER JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.user_id = c.id;
OJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL LEFT JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id GLOBAL LEFT JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.user_id = c.id;
CJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL CROSS JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s GLOBAL CROSS JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c WHERE o.product_id = s.id AND o.user_id = c.id;
SJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL LEFT SEMI JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id GLOBAL LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.user_id = c.id;
ATJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS o GLOBAL LEFT ANTI JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON o.product_id = s.id GLOBAL LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS c ON o.user_id = c.id;
--
IJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o INNER JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id INNER JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.user_id = c.id;
OJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o LEFT JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id LEFT JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.user_id = c.id;
CJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o CROSS JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s CROSS JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c WHERE o.product_id = s.id AND o.user_id = c.id;
SJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o LEFT SEMI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.user_id = c.id;
ATJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS o LEFT ANTI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON o.product_id = s.id LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS c ON o.user_id = c.id;
--
IJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL INNER JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id GLOBAL INNER JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.user_id = c.id;
OJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL LEFT JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id GLOBAL LEFT JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.user_id = c.id;
CJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL CROSS JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s GLOBAL CROSS JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c WHERE o.product_id = s.id AND o.user_id = c.id;
SJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL LEFT SEMI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id GLOBAL LEFT SEMI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.user_id = c.id;
ATJ,SELECT o.page_url, o.ts FROM test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS o GLOBAL LEFT ANTI JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON o.product_id = s.id GLOBAL LEFT ANTI JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS c ON o.user_id = c.id;
--
-- todas (SJ y ATJ no se pueden usar en este caso en doris)
IJ,SELECT so.order_id, so.ts FROM test.shoe_orders__sparseindex_by_order_id AS so INNER JOIN test.shoes__sparseindex_by_id AS s ON so.product_id = s.id INNER JOIN test.shoe_customers__sparseindex_by_id AS sc ON so.customer_id = sc.id INNER JOIN test.shoe_clickstream__sparseindex_by_page_url AS scs ON s.id = scs.product_id AND sc.id = scs.user_id;
OJ,SELECT so.order_id, so.ts FROM test.shoe_orders__sparseindex_by_order_id AS so LEFT JOIN test.shoes__sparseindex_by_id AS s ON so.product_id = s.id LEFT JOIN test.shoe_customers__sparseindex_by_id AS sc ON so.customer_id = sc.id LEFT JOIN test.shoe_clickstream__sparseindex_by_page_url AS scs ON s.id = scs.product_id AND sc.id = scs.user_id;
CJ,SELECT so.order_id, so.ts FROM test.shoe_orders__sparseindex_by_order_id AS so CROSS JOIN test.shoes__sparseindex_by_id AS s CROSS JOIN test.shoe_customers__sparseindex_by_id AS sc CROSS JOIN test.shoe_clickstream__sparseindex_by_page_url AS scs WHERE so.product_id = s.id AND so.customer_id = sc.id AND s.id = scs.product_id AND sc.id = scs.user_id;
--
IJ,SELECT so.order_id, so.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS so GLOBAL INNER JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON so.product_id = s.id GLOBAL INNER JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS sc ON so.customer_id = sc.id INNER JOIN test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS scs ON s.id = scs.product_id AND sc.id = scs.user_id;
OJ,SELECT so.order_id, so.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS so GLOBAL LEFT JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s ON so.product_id = s.id GLOBAL LEFT JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS sc ON so.customer_id = sc.id LEFT JOIN test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS scs ON s.id = scs.product_id AND sc.id = scs.user_id;
CJ,SELECT so.order_id, so.ts FROM test.shoe_orders__sparseindex_by_order_id__distributed_by_order_id AS so GLOBAL CROSS JOIN test.shoes__sparseindex_by_id__distributed_by_id AS s GLOBAL CROSS JOIN test.shoe_customers__sparseindex_by_id__distributed_by_id AS sc CROSS JOIN test.shoe_clickstream__sparseindex_by_page_url__distributed_by_page_url AS scs WHERE so.product_id = s.id AND so.customer_id = sc.id AND s.id = scs.product_id AND sc.id = scs.user_id;
--
IJ,SELECT so.order_id, so.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS so INNER JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON so.product_id = s.id INNER JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS sc ON so.customer_id = sc.id GLOBAL INNER JOIN test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS scs ON s.id = scs.product_id AND sc.id = scs.user_id;
OJ,SELECT so.order_id, so.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS so LEFT JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s ON so.product_id = s.id LEFT JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS sc ON so.customer_id = sc.id GLOBAL LEFT JOIN test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS scs ON s.id = scs.product_id AND sc.id = scs.user_id;
CJ,SELECT so.order_id, so.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts AS so CROSS JOIN test.shoes__sparseindex_by_id__partitioned_by_brand AS s CROSS JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state AS sc GLOBAL CROSS JOIN test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts AS scs WHERE so.product_id = s.id AND so.customer_id = sc.id AND s.id = scs.product_id AND sc.id = scs.user_id;
--
IJ,SELECT so.order_id, so.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS so GLOBAL INNER JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON so.product_id = s.id GLOBAL INNER JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS sc ON so.customer_id = sc.id GLOBAL INNER JOIN test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS scs ON s.id = scs.product_id AND sc.id = scs.user_id;
OJ,SELECT so.order_id, so.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS so GLOBAL LEFT JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s ON so.product_id = s.id GLOBAL LEFT JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS sc ON so.customer_id = sc.id GLOBAL LEFT JOIN test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS scs ON s.id = scs.product_id AND sc.id = scs.user_id;
CJ,SELECT so.order_id, so.ts FROM test.shoe_orders__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id AS so GLOBAL CROSS JOIN test.shoes__sparseindex_by_id__partitioned_by_brand__distributed_by_id AS s GLOBAL CROSS JOIN test.shoe_customers__sparseindex_by_id__partitioned_by_state__distributed_by_id AS sc GLOBAL CROSS JOIN test.shoe_clickstream__sparseindex_by_page_url__partitioned_by_ts__distributed_by_page_url AS scs WHERE so.product_id = s.id AND so.customer_id = sc.id AND s.id = scs.product_id AND sc.id = scs.user_id;
--
