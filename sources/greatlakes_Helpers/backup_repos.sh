#!/bin/bash

# Function to create a zip backup for each directory
create_zip_backup_of_repos() {
    local folder_path=$1
    local backup_date=$(date +%Y-%m-%d)
    local backup_dir="/home/halechr/BAK/repo_backups/${backup_date}"

    # Create the backup directory if it doesn't exist
    mkdir -p "$backup_dir"

    # Change to the parent folder
    cd "$folder_path" || exit 1

    # Loop through the specified directories
    for directory in "${@:2}"; do
        # Skip if the directory is not present
        if [ -d "$directory" ]; then
            local zip_filename="${backup_dir}/${directory}.zip"
            # Create the zip backup for the current directory, excluding .git
            zip -r "$zip_filename" "$directory" -x "$directory/.git/*"
            echo "Backup created for $directory: $zip_filename"
        else
            echo "Directory not found: $directory"
        fi
    done
}

# Example usage:
# folder_path="/home/halechr/repos"
# directories_to_backup=("NeuroPy" "pyPhoCoreHelpers" "pyPhoPlaceCellAnalysis" "Spike3D")

# create_zip_backup_of_repos "$folder_path" "${directories_to_backup[@]}"


# Function to create a zip backup for each directory
# create_daily_repos_archive_backup() {
#     local folder_path=$1
#     local backup_date=$(date +%Y-%m-%d)
#     local backup_dir="/home/halechr/BAK/repo_backups/${backup_date}"

#     # Create the backup directory if it doesn't exist
#     mkdir -p "$backup_dir"

#     # Change to the parent folder
#     cd "$folder_path" || exit 1

#     # Function to create a zip backup for a single directory
#     create_single_backup() {
#         local directory=$1
#         if [ -d "$directory" ]; then
#             local zip_filename="${backup_dir}/${directory}.zip"
#             local exclude_patterns=("${@:2}")

#             # Create the zip backup for the current directory, excluding specified patterns
#             zip -r "$zip_filename" "$directory" "${exclude_patterns[@]/#/-x }"
#             echo "Backup created for $directory: $zip_filename"
#         else
#             echo "Directory not found: $directory"
#         fi
#     }

#     # Export the function to make it available for parallel execution
#     export -f create_single_backup

#     # Perform the backups one by one
#     for directory in "${@:2}"; do
#         create_single_backup "$directory" "${@:3}"
#     done
# }

# # Example usage:
# folder_path="/home/halechr/repos"
# directories_to_backup=("NeuroPy" "pyPhoCoreHelpers" "pyPhoPlaceCellAnalysis" "Spike3D")
# exclude_patterns=("**/.git" "**/__pycache__" "**/.venv")

# # create_daily_repos_archive_backup "$folder_path" "${directories_to_backup[@]}"
# create_daily_repos_archive_backup "$folder_path" "${directories_to_backup[@]}" "${exclude_patterns[@]}"


backup_directories() {
  # Define a date string in the format YYYY-MM-DD
  DATE=$(date +"%Y-%m-%d")

  # Define the exclude patterns
  EXCLUDE_PATTERNS=("**/.git" "**/__pycache__" "**/.venv*")

  # Iterate over the directories and create a zip file for each
  for DIRECTORY in "$@"; do
    if [ -d "${DIRECTORY}" ]; then
      ZIP_NAME="${DATE}_$(basename ${DIRECTORY}).zip"
      # ZIP_NAME="${DATE}_$(basename ${DIRECTORY}).tar.gz"
      echo "Creating backup for ${DIRECTORY} as ${ZIP_NAME}..."
      
      # Create a temporary directory
      TEMP_DIR=$(mktemp -d)
      
      # Copy the contents, excluding the patterns
      rsync -av --exclude="${EXCLUDE_PATTERNS[@]}" "${DIRECTORY}/" "${TEMP_DIR}/"

      # Zip the temporary directory
      zip -r ${ZIP_NAME} -j "${TEMP_DIR}/"*
      #tar -czf ${ZIP_NAME} "${DIRECTORY}"
      # Remove the temporary directory
      rm -rf "${TEMP_DIR}"
    else
      echo "Skipping ${DIRECTORY} as it is not a directory."
    fi
  done
}

perform_backup_repos() {
  folder_path="/home/halechr/repos/"
  directories_to_backup=("NeuroPy" "pyPhoCoreHelpers" "pyPhoPlaceCellAnalysis" "Spike3D")

  # Build the absolute paths
  full_paths_to_directories_to_backup=()
  for dir_name in "${directories_to_backup[@]}"; do
    full_paths_to_directories_to_backup+=("${folder_path}${dir_name}")
  done
  # full_paths_to_directories_to_backup=("/home/halechr/repos/NeuroPy" "/home/halechr/repos/pyPhoCoreHelpers" "/home/halechr/repos/pyPhoPlaceCellAnalysis" "/home/halechr/repos/Spike3D")

  backup_directories "${full_paths_to_directories_to_backup[@]}"
}

# perform_backup_repos() 


perform_archive_directory() {
  local folder_path="$1"
  local directories_to_backup=$2
  # folder_path="/nfs/turbo/umms-kdiba/turbo/Pho/"
  # directories_to_backup=("PierreSecondRotation" "Environments")
  # directories_to_backup=("OLD__ARCHIVE")
  
  # Build the absolute paths
  full_paths_to_directories_to_backup=()
  for dir_name in "${directories_to_backup[@]}"; do
    full_paths_to_directories_to_backup+=("${folder_path}${dir_name}")
  done
  backup_directories "${full_paths_to_directories_to_backup[@]}"
}


perform_archive_directory "/nfs/turbo/umms-kdiba/turbo/Pho/" ("OLD__ARCHIVE")