#!/bin/bash

# Check to see if we got passed a month and year to look for in the logs.
if [ -n "$1" ]; then
  search=$1
else
  # If we didn't get one, exit since that's the whole point of the script.
  echo "No search value... Please pass a string to search for like 'Aug/2018'"
  exit 1
fi

# Check to see if our source files directory exists.
if [ -d ./source-files/ ]; then
  echo "Source files directory exists, moving to process files." >> log.txt
else
  echo "Source files directory does not exist." >> log.txt
  echo "Attempting to create source files directory..." >> log.txt
  # If it doesn't exist, try to create it.
  mkdir -p ./source-files/

  #Check to see how our mkdir command fared.
  if [ ! -d ./source-files/ ]; then
    echo "Source files directory cannot be created. Exiting."
    exit 1
  else
    echo "...source files directory created successfully." >> log.txt
    echo "Continuing on to process log files." >> log.txt
  fi
fi

# Iterate over all the files in our directory. In my use case, there is no
# consistent extensions uses, so I look at all files, ignore the ones I don't
# want, and treat the rest as log files.
for file in ./*; do
  # Check to see if we got passed a log filename to output to.
  if [ -n "$2" ]; then
    logfile=$2
  else
    # If we didn't, create one based on the filename.
    logfile="${file%.*}"
  fi

  # Get the filename for our file.
  filename=$(basename -- "$file")

  # Make sure to skip the executable file.
  if [ ${file: -3} == ".sh" ]; then
    echo "Skipping executable $filename." >> log.txt
    continue
  fi

  # Make sure to skip the log file.
  if [ $filename == "log.txt" ]; then
    echo "Skipping log file." >> log.txt
    continue
  fi

  # Make sure to skip backup files.
  if [ ${file: -1} == "~" ]; then
    echo "Skipping backup file $filename." >> log.txt
    continue
  fi

  # Make sure to skip directories.
  if [ -d $file ]; then
    echo "Skipping directory $filename." >> log.txt
    continue
  fi

  # If it's not a directory, backup file, or executable, process it.
  echo "Processing file $filename... Outputting to $logfile" >> log.txt
  cat $file | grep $search >> $logfile

  # After we process the files, move them to the source files directory.
  mv $filename ./source-files/$filename
done

