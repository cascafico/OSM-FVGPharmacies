# OSM-FVGPharmacies
data preparation for Openstreetmap import

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


adding header for csv2json utility, should obtain something like:
{;lon;lat;id;tags{;name;ref:vatin;addr:postcode;addr:city;start_date;addr:street;addr:housenumber;};}
7.68671719343681,45.065215435737798,1,San Francesco Da Paola,03603780010,10123,Torino,01/01/2005,Via San Francesco Da Paola,10
...



