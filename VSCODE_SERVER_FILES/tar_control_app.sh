#!/bin/bash

current_datetime="$(date '+%m-%d_%H-%M-%S')"
new_filename_base="control-app-${current_datetime}"
new_filename="control-app-${current_datetime}.tar.gz"

CONTROL_APP_FOLDER="$(dirname ~/control-app)"
BACKUPS_FOLDER="$(realpath ~/BACKUPS_CONTROL_APP)"
BACKUP_FILENAME="${BACKUPS_FOLDER}/${new_filename}"

if [[ ! -d "${BACKUPS_FOLDER}" ]]; then
    mkdir -p "${BACKUPS_FOLDER}"
fi
    
pushd $CONTROL_APP_FOLDER
tar cvzf "${BACKUP_FILENAME}" control-app
popd

echo
echo "Saved File to $(realpath ${BACKUP_FILENAME})"

