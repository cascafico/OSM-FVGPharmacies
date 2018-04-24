# value for OSM tag source
source = 'MDS'
#add_source = True

# do not add unique reference IDs to OSM?

#no_dataset_id = True
no_dataset_id = False
dataset_id = 'mds'

# Overpass query to use when searching OSM for data
#overpass_timeout = 120 default
overpass_timeout = 180
query = [('amenity', 'pharmacy')] 

# attenzione, coord errate possono rendere enorme il bbox
# vantaggio: fa richieste multiple ad overpass
bbox = True

# italia
#bbox = [35.28,6.62,47.1,18.79]

# tags to replace on matched OSM objects
master_tags = ('name', 'ref:vatin')

delete_unmatched = False
#tag_unmatched = { 
#'fixme':'This object might have been dismantled, please check' 
#'amenity':None,
#'disused:amenity':'fuel'
#}


# max distance to search for a match in meters
max_distance = 120
