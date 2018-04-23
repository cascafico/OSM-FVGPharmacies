#!/bin/bash

# some fixing of input qgis file, due to needed nested object formatting

# input example:
# 7.68671;45.06521;1;San Francesco Da Paola;03603780010;10123;Torino;01/01/2005;Via San Francesco Da Paola;10

# output for csv2json
# {;lon;lat;id;tags{;name;ref:vatin;addr:postcode;addr:city;start_date;addr:street;addr:housenumber;};}
# ;7.6028;45.003342;2;;Algostino Demichelis Di Gallo Dott. Mario;10170320013;10123;Torino;01/02/2015;Piazza Vittorio Veneto;10;;

awk -F ";" '{print ";" $1 ";" $2";"$3";;"$4";"$5";"$6";"$7";"$8";"$9";"$10";;"}' farmacie_rifinito.csv > farmacie_fixed.csv
sed -i '1 i\{;lon;lat;id;tags{;name;ref:vatin;addr:postcode;addr:city;start_date;addr:street;addr:housenumber;};}' farmacie_fixed.csv
sed -i 's/"//g' farmacie_fixed.csv

