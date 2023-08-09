#!/bin/bash

backup_dnf_list() {
  TODAYS_DATE=$(date +%Y%m%d)
  BACKUP_FILE="dnf_list_backup_${TODAYS_DATE}.txt"
  echo "Backing up the list of installed packages to ${BACKUP_FILE}..."
  dnf list installed > "${BACKUP_FILE}"
  echo "Backup completed."
}

restore_dnf_list() {
  if [ -z "$1" ]; then
    echo "Please provide the backup file name."
    exit 1
  fi

  BACKUP_FILE="$1"
  
  if [ ! -f "${BACKUP_FILE}" ]; then
    echo "File ${BACKUP_FILE} not found."
    exit 1
  fi

  echo "Restoring packages from ${BACKUP_FILE}..."
  awk '{print $1}' "${BACKUP_FILE}" > package_names.txt
  dnf install $(cat package_names.txt)
  rm package_names.txt
  echo "Restoration completed."
}

# Example usage
# backup_dnf_list
# restore_dnf_list "dnf_list_backup_20230809.txt"

