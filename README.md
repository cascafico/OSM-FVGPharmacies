# OSM-FVGPharmacies - data preparation for Openstreetmap import

pharmacies are ofted duplicate due to change in operator and not purging older ones (need filtering by "DATAFINEVALIDITA")

csv from MISA needs some string adjustment, which has to be performed by Qgis 
- unuseful field removal
- title string funct on "DESCRIZIONEFARMACIA" e "DESCRIZIONE_1" (comune)
- if "INDIRIZZO" contains a comma, split "INDIRIZZO" in street and housenumber accomplished with field calculator:   

for streetname, create a string field from query:
left("INDIRIZZO", strpos("INDIRIZZO", ','))   

for housenumber, create a string field from query:
CASE WHEN (strpos("INDIRIZZO", ','))!=-1 
  THEN  
right("INDIRIZZO", length("INDIRIZZO")-(strpos("INDIRIZZO", ',')+1))  
END


DATAINIZIO formatted from DD/MM/YYYY to intl YYYY-MM-DD a using substr

-----File fix.sh-----

also several cases of quotes used incorrectly, ie "Comunale ""Villa San Giuseppe"""
requires removing, done via awk in fix.sh

again, awk used to add header for csv2json utility and some semicolon after tag fiels to obtain something like:
{;lon;lat;id;tags{;name;ref:vatin;addr:postcode;addr:city;start_date;addr:street;addr:housenumber;};}
;7.6028;45.003342;2;;Algostino Demichelis Di Gallo Dott. Mario;10170320013;10123;Torino;01/02/2015;Piazza Vittorio Veneto;10;;
...



