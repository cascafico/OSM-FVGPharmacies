#!/bin/bash

# some fixing of input qgis file, due to needed nested object formatting

# input example:
# 7.68671;45.06521;1;San Francesco Da Paola;03603780010;10123;Torino;01/01/2005;Via San Francesco Da Paola;10

echo "fixing some peculiar rows, backslashes and Nan"
sed -i 's|\|/|g' farmacie_rifinito.csv
sed -i 's/;Nan;/TBD/g' farmacie_rifinito.csv


echo "removing quotes"
sed -i 's/"//g' farmacie_rifinito.csv

echo "adding trailing _ to escape number transform for postcode and housenumber in subsequent csv2json"
awk -F ";" '{print ";"$1";"$2";"$3";;"$4";IT"$5";_"$6";"$7";"$8";"$9";_"$10";;"}' farmacie_rifinito.csv > farmacie_fixed.csv     

echo "adding headers for nested json"
sed -i '1 i\{;lon;lat;id;tags{;name;ref:vatin;addr:postcode;addr:city;start_date;addr:street;addr:housenumber;};}' farmacie_fixed.csv

echo "converting csv2json"
python csv2json.py farmacie_fixed.csv

echo "removing trailing _"
sed -i 's/"_/"/g' farmacie_fixed.csv.json



