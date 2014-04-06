#!/bin/bash
# 
# tiffify.sh
# ==========
# script to turn OSGB Street View geotiffs into 'real' geotiffs for use in geoserver
#
# set base working directory /var/tmp/maps
# 'SS' - two letters denoting OSGB Sheet code: i.e 'NS', 'HP'
# top-level streetview string: "OS Street View SS"
# TFW files in "OS Street View SS/data/georeferencing files/tfw/xxxxxx.TFW"
# tif files in "OS Street View SS/data/SS/xxxxxx.tif"

for folder in *"OS Street View "* 
do
outdir=/var/tmp/maps/UK-RASTER/
base=${folder}
sheet_UC=${folder:15:17}
sheet_lc=${sheet_UC,,}
base_tif="${base}/data/${sheet_lc}/"
base_tfw="${base}/data/georeferencing files/tfw/"
     for file in "${base_tif}"*.tif
     do
	 stem="${file:26:6}"
         in_tif="${base_tif}${stem}.tif"
         out_tif="${outdir}${stem}.TIF"
 	 tfw="${base_tfw}${stem}.TFW"
	 meta="${outdir}${stem}.meta"

	 listgeo "${in_tif}" > "${meta}"
	 echo "creating:        ${meta}"
	 geotifcp -e "${tfw}" -g "${meta}" "${in_tif}" "${out_tif}"
	 echo "creating:        ${out_tif}" 
	 rm "${meta}"
	 echo "removed:        ${meta}"
     done
done
