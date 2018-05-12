#!/usr/bin/env bash



RESET="\e[0m"
YELLOW="\e[93m"
GREEN="\e[32m"
RED="\e[31m"
BOLD="\e[1m"
INVERT="\e[7m"
ERR=0

errorMessage() {
    echo -e "${BOLD}${YELLOW}${INVERT} Error ${RESET} no value set for ${BOLD}${YELLOW}${1}${RESET}"
}

validateBoolString() {
    BOOL=`echo "$1" | tr '[:upper:]' '[:lower:]'`
    if [[ "$BOOL" != "true" && "$BOOL" != "false" ]]
    then
        echo ""
    else
        echo "$BOOL"
    fi
}

# -------  database credentials input stage

echo ""
echo -e "Checking your ${BOLD}${YELLOW}${INVERT}mysql${RESET} credentials..."

DB=$1
HOST=$2
LOGIN=$3
PASS=$4

if [[ -z "${LOGIN// }" ]]
then
    echo ""
    echo -e "${BOLD}${YELLOW}username/login${RESET}:"
    read LOGIN
fi

if [[ -z "${PASS// }" ]]
then
    echo ""
    echo -e "${BOLD}${YELLOW}password${RESET}:"
    read -s PASS
fi


# ------- errors
#

if [[ -z "${DB// }" ]]
then
    ERR=$((ERR+1))
    errorMessage "mysql database name"
fi

if [[ -z "${LOGIN// }" ]]
then
    ERR=$((ERR+1))
    errorMessage "mysql username/login"
fi

if [[ -z "${PASS// }" ]]
then
    ERR=$((ERR+1))
    errorMessage "mysql password"
fi

if [[ -z "${HOST// }" ]]
then
    ERR=$((ERR+1))
    errorMessage "mysql hostname"
fi

# ------- status check and go!
#

if [ "$ERR" != "0" ]
then
    echo ""
    echo -e "${RED}${BOLD}ERROR!${RESET} Setup failed."
    echo ""
    exit 1
else
    echo "We are good to go"
    exit 0;
fi

