#!/bin/bash

# The following variables are defined in adsorber.conf or adsorber.sh
# If you run this file independently following variables need to be set:
# ---variable:----------  ---default value:---
# HOSTS_FILE_PATH         /etc/hosts
# HOSTS_FILE_BACKUP_PATH  /etc/hosts.original


revertHostsFile() {
    if [ -f "${HOSTS_FILE_BACKUP_PATH}" ]; then
        cp "${HOSTS_FILE_BACKUP_PATH}" "${HOSTS_FILE_PATH}" \
            && echo -e "${PREFIX}Successfully reverted ${HOSTS_FILE_PATH}." \
            && echo -e "${PREFIX}To reapply please run './adsorber.sh update'"
    else
        echo -e "${PREFIX_WARNING}Can not restore hosts file. Original hosts file does not exist." 1>&2
        exit 1
    fi

    return 0
}


revert() {
    echo -e "${BWHITE}Reverting ${HOSTS_FILE_PATH} ...${COLOUR_RESET}"
    revertHostsFile

    return 0
}
