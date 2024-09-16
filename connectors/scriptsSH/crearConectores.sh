#!/bin/bash

# Ejecutar los scripts en segundo plano
./crearConector_shoe_clickstream.sh &
./crearConector_shoe_customers.sh &
./crearConector_shoe_orders.sh &
./crearConector_shoes.sh &

# Esperar a que todos los trabajos terminen
wait

