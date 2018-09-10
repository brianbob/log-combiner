#!/bin/bash

for file in /var/www/html/docroot/*; do

  logfile="${file%.*}"

  filename=$(basename -- "$file")

  echo "Processing file $filename... Outputting to $logfile" >> log.txt

  cat $file | grep Jan/2016 >> $logfile

  mv $filename ./source-files/$filename

done
