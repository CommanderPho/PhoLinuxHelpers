#!/bin/bash

# Function to create a zip backup for each directory
export_filelist_csv_of_directory() {
    local folder_path=$1

	# Define a date string in the format YYYY-MM-DD
	DATE=$(date +"%Y-%m-%d")

    # Change to the parent folder
    cd "$folder_path" || exit 1

	local csv_filename="${DATE}_$(basename "${folder_path}").csv"

	echo "\"Filename\",\"Path\"" > "${csv_filename}"
	find "$folder_path" -type f -print0 | while IFS= read -r -d '' file; do
		echo "\"$(basename "$file")\",\"$(dirname "$file")\""
	done >> "${csv_filename}"
	echo "CSV filelist created for $folder_path: $csv_filename"
    
}


export_filelist_csv_of_directory "/nfs/turbo/umms-kdiba/Pho/"