# OSM-FVGPharmacies
data preparation for Openstreetmap import

pharmacies are ofted duplicate due to change in operator and not purging older ones (need filtering by "DATAFINEVALIDITA")

csv from MISA needs some string adjustment, which has to be performed by Qgis 
- unuseful field removal
- title string funct on "DESCRIZIONEFARMACIA"
- if "INDIRIZZO" contains a comma, split "INDIRIZZO" in street and housenumber accomplished with field calculator:   

for streetname, create a string field from query
left("INDIRIZZO", strpos("INDIRIZZO", ','))   

for housenumber, create a string field from query
CASE WHEN (strpos("INDIRIZZO", ','))!=-1 
  THEN  
right("INDIRIZZO", length("INDIRIZZO")-(strpos("INDIRIZZO", ',')+1))  
  
END

