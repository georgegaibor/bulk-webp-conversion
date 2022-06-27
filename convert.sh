echo "(decode/encode): "
read operation

if [ "$operation" == "encode" ]
then
        echo "Enter current format (.png/.jpg/.jpeg): "
        read file_extension
        
        for filename in ./*"$file_extension"; do
                cwebp -q 70 "$filename" -o "${filename%.*}".webp
                rm "$filename"
        done
fi

if [ "$operation" == "decode" ]
then
        echo "Enter target format (.png/.jpg/.jpeg): "
        read file_extension
        for filename in ./*.webp; do
                dwebp "$filename" -o "${filename%.*}"."$file_extension"
                rm "$filename"
        done
fi
