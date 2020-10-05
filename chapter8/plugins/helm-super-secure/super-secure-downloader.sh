#!/usr/bin/env bash
set -e

# The fourth argument is the URL to the resource to download from the repo
URL="${4}"

# Replace "ss://" with "https://"
URL="$(echo ${URL} | sed 's/ss:/https:/')"

# Request the resource using the token, outputting contents to stdout
echo "Downloading $(basename ${URL}) using super-secure plugin..." 1>&2
curl -sL -H "Authorization: Bearer ${SUPER_SECURE_TOKEN}" "${URL}"

