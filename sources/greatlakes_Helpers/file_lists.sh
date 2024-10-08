#!/bin/bash

# Function to export a CSV of filenames and their paths from a directory
export_filelist_csv_of_directory() {
    local folder_path=$1

    # Define a date string in the format YYYY-MM-DD
    DATE=$(date +"%Y-%m-%d")

    local csv_filename="$folder_path${DATE}_$(basename "${folder_path}").csv"

    echo "\"Filename\",\"Path\"" > "${csv_filename}"
	## Recurrsive (all sub-files and folders):
    # find "$folder_path" -type f -print0 | while IFS= read -r -d '' file; do

	## non-recurrsive (only direct files in the dir)
	# find "$folder_path" -maxdepth 1 -type f -print0 | while IFS= read -r -d '' file; do
	find "$folder_path" -maxdepth 1 -print0 | while IFS= read -r -d '' file; do # files OR folders

    echo "\"$(basename "$file")\",\"$(dirname "$file")\""
	done >> "${csv_filename}"


    echo "CSV filelist created for $folder_path: $csv_filename"
}


# export_filelist_csv_of_directory "/nfs/turbo/umms-kdiba/Pho/"