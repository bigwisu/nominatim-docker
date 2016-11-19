#!/bin/bash
# refer to http://openstreetmap.id/en/data-openstreetmap-indonesia/
# for full list of pbf files of Indonesia

pbfs=(
    Jakarta.pbf
    JawaBarat.pbf
    Banten.pbf
    Yogyakarta.pbf
    JawaTengah.pbf
    JawaTimur.pbf
    Bali.pbf
)

for i in "${pbfs[@]}"
do
   :
   wget --header="User-Agent: Mozilla/5.0 (Windows NT 6.0) AppleWebKit/537.11 (KHTML, like Gecko) \
                  Chrome/23.0.1271.97 Safari/537.11" \
        --output-document=$i http://openstreetmap.id/data/pbf/$i
done

osmconvert ${pbfs[@]} -o=data.pbf

#cleanup
rm -rf ${pbfs[@]}
