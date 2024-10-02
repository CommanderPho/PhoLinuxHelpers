#!/bin/bash

# Function to export a CSV of filenames and their paths from a directory
export_filelist_csv_of_directory() {
    local folder_path=$1

    # Define a date string in the format YYYY-MM-DD
    DATE=$(date +"%Y-%m-%d")

    local csv_filename="${DATE}_$(basename "${folder_path}").csv"

    echo "\"Filename\",\"Path\"" > "${csv_filename}"
    find "$folder_path" -type f -print0 | while IFS= read -r -d '' file; do
        echo "\"$(basename "$file")\",\"$(dirname "$file")\""
    done >> "${csv_filename}"
    echo "CSV filelist created for $folder_path: $csv_filename"
}


export_filelist_csv_of_directory "/nfs/turbo/umms-kdiba/Pho/"