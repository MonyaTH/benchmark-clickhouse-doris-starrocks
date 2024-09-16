#!/bin/bash

# Verificar que se haya proporcionado un nombre de archivo SQL
if [ -z "$1" ]; then
    echo "Uso: $0 <SQL_FILE>"
    exit 1
fi

SQL_FILE="$1"

if [ "$SQL_FILE" = "join_queries.sql" ]; then
    OUTPUT_FILE="join_result.csv"
else 
    OUTPUT_FILE="result.csv"
fi

TRIES=5
QUERY_ID=1
cat "$SQL_FILE" | while IFS=, read -r QUERY_TYPE QUERY_TEXT; do
    if [[ -z "$QUERY_TEXT" ]] || [[ "$QUERY_TEXT" =~ ^-- ]]; then
        continue
    fi

    [ -z "$FQDN" ] && sync
    [ -z "$FQDN" ] && echo 3 | tee /proc/sys/vm/drop_caches > /dev/null

    if [[ "$QUERY_TEXT" =~ distributed ]]; then
        QUERY_DIST="DIST"
    else
        QUERY_DIST="LOCAL"
    fi

    if [[ "$QUERY_TEXT" =~ partitioned ]]; then
        QUERY_PART="PART"
    else
        QUERY_PART="NOPART"
    fi

    if [[ "$QUERY_TEXT" =~ bitmap_index ]]; then
        QUERY_INDEX="BITMAP"
    elif [[ "$QUERY_TEXT" =~ ngram_bloom_filter ]]; then
        QUERY_INDEX="NGBF"
    else 
        QUERY_INDEX="NOINDEX"
    fi

    if [[ "$QUERY_TEXT" =~ duplicatekey ]]; then
        TABLE_TYPE="DK"
    elif [[ "$QUERY_TEXT" =~ primarykey ]]; then
        TABLE_TYPE="PK"
    else 
        TABLE_TYPE="NULL"
    fi

    # Extraer el nombre de las tablas
    TABLE_NAMES=$(echo "$QUERY_TEXT" | grep -oP '(shoes|shoe_orders|shoe_customers|shoe_clickstream)__\w+' | awk -F'__' '{print toupper($1)}' | paste -sd '|')

    echo -n "${QUERY_ID},${QUERY_TYPE},${QUERY_DIST},${QUERY_PART},${TABLE_NAMES},${TABLE_TYPE},${QUERY_INDEX}," | tee -a $OUTPUT_FILE

    for i in $(seq 1 $TRIES); do
        RES=$(mysql -vvv -h127.1 -P9030 -uroot test -e "${QUERY_TEXT}" | perl -nle 'print $1 if /\((\d+\.\d+)+ sec\)/' ||:)

        echo -n "${RES}" | tee -a $OUTPUT_FILE
        [[ "$i" != $TRIES ]] && echo -n "," | tee -a $OUTPUT_FILE
    done

    echo "" | tee -a $OUTPUT_FILE

    QUERY_ID=$((QUERY_ID + 1))
done
