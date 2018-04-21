#!/bin/sh

parameters="${*}"

printf "Running Adsorber in portable-mode"
if [ ! "${parameters}" = "" ]; then
        printf " with %s parameter(s): '%s'" "${#}" "${parameters}"
fi
printf " ...\\n"

# Get the path of scripts root directory
readonly source_dir_path="$(cd "$(dirname "${0}")" && pwd)"

echo ""

# Call adsorber from the src/bin/ directory
if ("${source_dir_path}/src/bin/adsorber" ${parameters}); then
        exit_code=$?

        echo ""
        echo "Adsorber in portable-mode exited with code ${exit_code}."
else
        exit_code=$?

        echo ""
        # I defined exit code 80 as an error code if wrong or no input has been made
        if [ "${exit_code}" -eq 80 ]; then
                echo "You've supplied no or wrong parameters."
        fi

        echo "Adsorber in portable-mode exited with code ${exit_code}. Thats an error."
fi
