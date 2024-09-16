#################################################################################
################################ PASOS INICIALES ################################
#################################################################################

cd ./cluster_doris


..\connectors\crearConectores.ps1

Get-ChildItem -Path . -Recurse -Filter "cluster_id" -File | Remove-Item -Force

rmdir cluster

mkdir cluster/be-01/log
mkdir cluster/be-01/storage
mkdir cluster/be-02/log
mkdir cluster/be-02/storage
mkdir cluster/be-03/log
mkdir cluster/be-03/storage
mkdir cluster/fe/log
mkdir cluster/fe/doris-meta


docker compose up -d

################ CONFIGURACIÓN FE

docker exec -it fe bash

echo "priority_networks = 172.19.0.0/24" >> /opt/apache-doris/fe/conf/fe.conf

echo "meta_dir=/opt/apache-doris/fe/doris-meta" >> /opt/apache-doris/fe/conf/fe.conf

echo "table_name_length_limit = 256" >> /opt/apache-doris/fe/conf/fe.conf

tail /opt/apache-doris/fe/conf/fe.conf

exit

################ CONFIGURACIÓN BEs

docker exec -it be-1 bash

docker exec -it be-2 bash

docker exec -it be-3 bash

echo vm.max_map_count=2000000 >> /etc/sysctl.conf
 
sysctl -p

echo "priority_networks = 172.19.0.0/24" >> /opt/apache-doris/be/conf/be.conf

echo JAVA_HOME=/usr/local/openjdk-8/ >> /opt/apache-doris/be/conf/be.conf

echo storage_root_path=/opt/apache-doris/be/storage/ >> /opt/apache-doris/be/conf/be.conf

echo sys_log_dir=/opt/apache-doris/be/log >> /opt/apache-doris/be/conf/be.conf

echo "mem_limit = 98%" >> /opt/apache-doris/be/conf/be.conf

tail /opt/apache-doris/be/conf/be.conf

exit 


################ REINICIAR FE Y BEs

docker restart fe be-1 be-2 be-3

################ INICIAR BEs

docker exec -it be-1 bash

docker exec -it be-2 bash

docker exec -it be-3 bash

/opt/apache-doris/be/bin/start_be.sh --daemon

exit

################ ENTRAR A FE Y AÑADIR NODOS BE

docker exec -it fe bash

mysql -P 9030 -h 127.0.0.1 -u root

ALTER SYSTEM ADD BACKEND "172.19.0.199:9050";
ALTER SYSTEM ADD BACKEND "172.19.0.200:9050";
ALTER SYSTEM ADD BACKEND "172.19.0.201:9050";

ALTER SYSTEM DROPP BACKEND "127.0.0.2:9050";

SHOW backends\G;


-- mysql -h 127.0.0.1 -P9030 -uroot -e "DROP DATABASE test"

-- mysql -h 127.0.0.1 -P9030 -uroot -e "CREATE DATABASE test"

-- mysql -h 127.0.0.1 -P9030 -uroot test < create.sql

mysql -h 127.0.0.1 -P9030 -uroot test < test.sql
 
-- install bc 
apt-get update

apt-get install bc


ALTER TABLE shoe_orders__duplicatekey__sparseindex_by_order_id__partitioned_by_ts__distributed_by_order_id 
ADD  PARTITION p201704 VALUES LESS THAN("2020-05-01") DISTRIBUTED BY HASH(`user_id`) BUCKETS 5;




######### SI DA ERROR DE MEMORIA #########
-- EJECUTAR ESTO PARA CADA NODO BE
docker update --memory-swap 8g be-1
docker update --memory-swap 8g be-2
docker update --memory-swap 8g be-3

-- REINICIAR BES 
docker restart be-1 be-2 be-3

-- DEBERÍA FUNCIONAR ASÍ
###########################################################################
################################# PRUEBAS #################################
###########################################################################

CREATE DATABASE test;

USE test;

-- PARA CONECTARSE A LA WEB DEL FE
-- http://127.0.0.1:8030/
-- usuario: root, contraseña: nada, dejar vacía
-- antes debo haber ejecutado: 
set enable_profile=true;


-- Para obtener la fecha a partir de milisegundos
select from_unixtime(1609482470000/1000);

-- 'min_load_replica_num' = '3', -- Así aseguramos que se escribe en las tres réplicas antes de continuar, aseguramos consistencia
-- "enable_unique_key_merge_on_write" = "true" -- para habilitar la combinación en escritura


PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_1;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_2;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_3;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_4;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_5;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_6;

PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_1;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_2;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_3;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_4;

PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_1;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_2;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_3;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_4;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_5;

PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_1;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_2;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_3;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_4;
PAUSE ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_5;



RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_1;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_2;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_3;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_4;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_5;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoes_6;

RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_1;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_2;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_3;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_orders_4;

RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_1;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_2;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_3;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_4;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_customers_5;

RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_1;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_2;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_3;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_4;
RESUME ROUTINE LOAD FOR test.ROUTINE_LOAD_JOB_shoe_clickstream_5;



