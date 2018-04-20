# OSM-FVGPharmacies
data preparation for Openstreetmap import

pharmacies are ofted duplicate due to change in operator and not purging older ones (need filtering by "DATAFINEVALIDITA")

csv from MISA needs some string adjustment, which has to be performed by Qgis 
- unuseful field removal
- title string funct on "DESCRIZIONEFARMACIA"
- split "INDIRIZZO" in street and housenumber accomplished with field calculator:
  left("INDIRIZZO", strpos("INDIRIZZO", ','))

