Tiffify.sh
=================
A script to create 'real' geotiffs from OSGB Street View tifs

Requirements:
linux (cygwin not tested)
listgeo
geotifcp

1. download OS Street View zip files from Ordnance Survey OpenData project
2. Unzip downloads into one directory. It should be populated with directories named 'OS Street View SS' where 'SS' is the mapsheet code.
3. IMPORTANT: don't rename these directories or anything inside them. This script relies on character number substring matching. Renaming things will at best just not work, at worst destroy your data. If you have space, copy the entire directory tree somewhere else (/var/tmp/maps/ is used by the script).
4. edit tiffify.sh so that the location of the data tree is known to the script.
5. edit tiffify.sh so that the output location is known (it must exist already: /var/tmp/maps/UK-RASTER is used by the script).
6. copy tiffify.sh to the where you unziped the 'OS Street View' directories. 
7. run ./tiffify.sh 
8. watch some TV or something while it chuggs through the info. 

IMPORTANT: 
There is no error checking, signal interupt captures or other such desirable features. Tiffify doesn't fail gracefully. It can't stop, record progress and resume later. It doesn't indicate progress/total-progress, just prints file names as they are processed. 
