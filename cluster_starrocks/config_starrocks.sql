#######################################################################
########################### PASOS INICIALES ###########################
#######################################################################

cd ./cluster_starrocks

Get-ChildItem -Path . -Recurse -Filter "cluster_id" -File | Remove-Item -Force

find . -name "*cluster_id*" -type f -exec rm -f {} \;

rmdir cluster

mkdir cluster/be-1/log
mkdir cluster/be-1/storage
mkdir cluster/be-2/log
mkdir cluster/be-2/storage
mkdir cluster/be-3/log
mkdir cluster/be-3/storage
mkdir cluster/fe/log
mkdir cluster/fe/meta


docker compose up -d

..\connectors\crearConectores.bat




################ CONFIGURACIÓN FE

docker exec -it fe bash

echo "max_routine_load_task_num_per_be = 24" >> /opt/starrocks/fe/conf/fe.conf

docker restart fe



docker exec -it fe bash


mysql -P 9030 -h 127.0.0.1 -u root

SHOW backends\G;


ALTER SYSTEM ADD BACKEND "10.5.0.3:9050";
ALTER SYSTEM ADD BACKEND "10.5.0.4:9050";
ALTER SYSTEM ADD BACKEND "10.5.0.5:9050";

ALTER SYSTEM DROP BACKEND "10.5.0.3:9050";
ALTER SYSTEM DROP BACKEND "10.5.0.4:9050";
ALTER SYSTEM DROP BACKEND "10.5.0.5:9050";


-- mysql -h 127.0.0.1 -P9030 -uroot -e "DROP DATABASE test"

-- mysql -h 127.0.0.1 -P9030 -uroot -e "CREATE DATABASE test"

-- mysql -h 127.0.0.1 -P9030 -uroot test < create.sql

mysql -h 127.0.0.1 -P9030 -uroot test < test.sql

-- PARA CONECTARSE A LA WEB DEL FE
-- http://127.0.0.1:8030/
-- usuario: root, contraseña: nada, dejar vacía
-- antes debo haber ejecutado: 
set enable_profile=true;


############### CONFIGURACIÓN

SHOW PROFILELIST LIMIT 10;

select regexp_extract(get_query_profile('query_id'), 'PredFilterRows: [0-9.]*[A-Z]*', 0);

-- MAXIMO 3M





PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_1;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_2;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_3;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_4;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_5;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_6;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_7;

PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_1;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_2;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_3;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_4;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_5;

PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_1;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_2;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_3;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_4;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_5;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_6;

PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_1;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_2;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_3;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_4;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_5;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_6;



RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_1;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_2;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_3;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_4;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_5;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_6;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_7;

RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_1;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_2;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_3;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_4;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_5;

RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_1;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_2;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_3;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_4;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_5;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_6;

RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_1;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_2;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_3;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_4;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_5;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_6;
