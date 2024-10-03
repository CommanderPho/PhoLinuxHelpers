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

backup_directories() {
  ## 2024-10-02 - Newer than `create_zip_backup_of_repos`, written by ChatGPT
  # See `perform_archive_directory` instead for direct usage

  # Define a date string in the format YYYY-MM-DD
  DATE=$(date +"%Y-%m-%d")

  # Define the exclude patterns
  EXCLUDE_PATTERNS=("**/.git" "**/__pycache__" "**/.venv*" "**/.DS_Store")

  # Build rsync exclude options
  RSYNC_EXCLUDES=()
  for pattern in "${EXCLUDE_PATTERNS[@]}"; do
    RSYNC_EXCLUDES+=("--exclude=${pattern}")
  done

  # Specify your temporary base directory
  TEMP_BASE_DIR="/scratch/kdiba_root/kdiba0/halechr"
  # Ensure the temporary base directory exists
  if [ ! -d "${TEMP_BASE_DIR}" ]; then
    echo "Temporary base directory ${TEMP_BASE_DIR} does not exist. Creating it..."
    mkdir -p "${TEMP_BASE_DIR}"
  fi

  # Iterate over the directories and create a zip file for each
  for DIRECTORY in "$@"; do
    if [ -d "${DIRECTORY}" ]; then

      ZIP_NAME="$(dirname "${DIRECTORY}")/${DATE}_$(basename "${DIRECTORY}").zip"
      echo "Creating backup for ${DIRECTORY} as ${ZIP_NAME}..."
      
      # Create a temporary directory within the specified temp space
      TEMP_DIR=$(mktemp -d -p "${TEMP_BASE_DIR}")

      # Copy the contents, excluding the patterns
      rsync -av "${RSYNC_EXCLUDES[@]}" "${DIRECTORY}/" "${TEMP_DIR}/"

      # Zip the temporary directory
      zip -r "${ZIP_NAME}" "${TEMP_DIR}/"*
      
      # Remove the temporary directory
      rm -rf "${TEMP_DIR}"
    else
      echo "Skipping ${DIRECTORY} as it is not a directory."
    fi
  done
}


perform_archive_directory() {
  local folder_path="$1"
  shift
  local directories_to_backup=("$@")
  # # Backup Repos:
  # directories_to_backup=("NeuroPy" "pyPhoCoreHelpers" "pyPhoPlaceCellAnalysis" "Spike3D")
  # perform_archive_directory "/home/halechr/repos/" "${directories_to_backup[@]}"

  # Example usage with a list of directories
  # directories_to_backup=("Rotation_3_Kamran Diba Lab" "OLD__ARCHIVE")
  # perform_archive_directory "/nfs/turbo/umms-kdiba/Pho/" "${directories_to_backup[@]}"

  # directories_to_backup=("_BAK_2024-10-01")
  # perform_archive_directory "/nfs/turbo/umms-kdiba/Data/Output/gen_scripts/" "${directories_to_backup[@]}"


  # Build the absolute paths
  full_paths_to_directories_to_backup=()
  for dir_name in "${directories_to_backup[@]}"; do
    full_paths_to_directories_to_backup+=("${folder_path}${dir_name}")
  done
  
  backup_directories "${full_paths_to_directories_to_backup[@]}"
}


# # Backup Repos:
# directories_to_backup=("NeuroPy" "pyPhoCoreHelpers" "pyPhoPlaceCellAnalysis" "Spike3D")
# perform_archive_directory "/home/halechr/repos/" "${directories_to_backup[@]}"

# Example usage with a list of directories
# directories_to_backup=("Rotation_3_Kamran Diba Lab" "OLD__ARCHIVE")
# perform_archive_directory "/nfs/turbo/umms-kdiba/Pho/" "${directories_to_backup[@]}"

## All
# directories_to_backup=("PierreSecondRotation" "Environments" "Rotation_3_Kamran Diba Lab" "OLD__ARCHIVE")
# perform_archive_directory "/nfs/turbo/umms-kdiba/Pho/" "${directories_to_backup[@]}"

# source /home/halechr/repos/PhoLinuxHelpers/sources/greatlakes_Helpers/backup_repos.sh
# directories_to_backup=("analysesResults")
# perform_archive_directory "/nfs/turbo/umms-kdiba/Pho/" "${directories_to_backup[@]}"


# directories_to_backup=("Rotation_3_Kamran Diba Lab")
# perform_archive_directory "/nfs/turbo/umms-kdiba/Pho/" "${directories_to_backup[@]}"