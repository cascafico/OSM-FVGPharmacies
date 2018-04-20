#!/bin/bash

# dataset info page:
# http://www.dati.salute.gov.it/dati/dettaglioDataset.jsp?menu=dati&idPag=5

ADESSO=`date +"%Y-%m-%d"`

wget -nc -O $ADESSO.csv "http://www.dati.salute.gov.it/imgs/C_17_dataset_5_download_itemDownload0_upFile.CSV"

awk -F ";" 'split($3, addr, ",") split($19, lat, ",") split($20, lon, ",") {print $1 ";" lat[1]"."lat[2] ";" lon[1]"."lon[2] ";" addr[1] ";" addr[2] ";" $6 ";" $8 ";" $15}' $ADESSO.csv > _$ADESSO.csv

