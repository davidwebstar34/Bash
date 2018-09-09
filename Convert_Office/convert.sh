#!/bin/bash

/usr/lib/libreoffice/program/soffice.bin --headless --nofirststartwizard -accept="socket,host=localhost,port=8100;urp;StarOffice.Service" &

mkdir converted_files

while IFS= read -d $'\0' -r file ; do
        printf 'File found: %s\n' "$file"
        echo 'File found: ' "$file"  >> conversion.log
        unoconv -f pdf "$file"
done < <(find . ! -name "*.log" ! -name "*.sh" -type f -print0)
