# Filtrador de repeticiones por patron
# ./filter_repeats.sh "LINE" blastx_result.txt /ssd/estebanpw/oswaldo-irene-gecko/advenimiento/homsa-x/homsa-x.repeats

patron=$1
fichero=$2
repeats=$3
temp_matches=${fichero}.id_matches
temp_all=${fichero}.id_all
temp_rest=${fichero}.id_rest
output=filter_${patron}_$(basename $repeats)

echo "Filtering by: $patron"

# filtra los que tienen el patron y lo guarda en el archivo temp_matches
grep $patron $fichero | awk -F "\t" '{if (NF > 1) print $2}' | uniq > $temp_matches

# obtenemos en otro temp todos los ids
awk -F "\t" '{if (NF > 1) print $2}' $fichero | uniq > $temp_all

#printf "Occurrences: "

while IFS= read -r linea
do
    # obtenemos el complemento de matches respecto all
    search=$(grep $linea $temp_matches)
    if [ -z "$search" ]
    then
#    	printf "$linea; "
    	echo "$linea" >> $temp_rest
    fi
done < "$temp_all"
#echo ""

# machaca previamente el contenido del output
> $output

# lee el fichero rest, filtra el fichero repeats y lo guarda en output
while IFS= read -r linea
do
    # coge cada id de rest y lo concatena a output
    #printf " $linea;"
    sed -n -e '/'"$linea"'$/,/>/ p' $repeats | sed '$d' >> $output
done < "$temp_rest"

echo "Saved in: $output"

# borra el archivo temporal
rm $temp_matches $temp_all $temp_rest

