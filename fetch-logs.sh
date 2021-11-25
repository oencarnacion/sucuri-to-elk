#!/bin/bash

# date
CF_DATE=$(date +"%Y-%m-%d")

# grab logs from sucuri
for i in $(echo ${SECRETO} | sed "s/,/ /g");do
  OUTPUT_DIR="/sucuri-logs/${i}/${CF_DATE}"
  OUTPUT_LOG="${OUTPUT_DIR}/${CF_DATE}.csv"
  mkdir -p "${OUTPUT_DIR}"
  curl "https://waf.sucuri.net/api?v2" --data "k=d322ca33ce9a9a8de84ac1788596f740" --data "s=${i}" --data "a=audit_trails" --data "date=${CF_DATE}" --data "format=csv" > ${OUTPUT_LOG}
done

