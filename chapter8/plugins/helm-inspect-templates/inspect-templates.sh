#!/usr/bin/env bash
set -e

# First argument on the command line, a relative path to a chart directory
CHART_DIRECTORY="${1}"

# Fail if no chart directory provided or is invalid
if [[ "${CHART_DIRECTORY}" == "" ]]; then
    echo "Usage: helm inspect-templates <chart_directory>"
    exit 1
elif [[ ! -d "${CHART_DIRECTORY}" ]]; then
    echo "Invalid chart directory provided: ${CHART_DIRECTORY}"
    exit 1
fi

# Print a summary of the chart's templates
cd "${CHART_DIRECTORY}"
cd templates/
echo "----------------------"
echo "Chart template summary"
echo "----------------------"
echo ""
total="$(find . -type f -name '*.yaml' -maxdepth 1 | wc -l | tr -d '[:space:]')"
echo " Total number: ${total}"
echo ""
echo " List of templates:"
for filename in $(find . -type f -name '*.yaml' -maxdepth 1 | sed 's|^\./||'); do
    kind=$(cat "${filename}" | grep kind: | head -1 | awk '{print $2}')
    echo "  - ${filename} (${kind})"
done
echo ""

