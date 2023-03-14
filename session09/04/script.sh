#!/usr/bin/env bash

help () {
cat << EOF

  -h | --help            Prints this message
  -g | --group           Resource group of the storage account
  -f | --pathtofile      Supply values from file, you can overwrite
                         settings from file using flags
EOF
}

split_by_space () {
KEY=$1
VALUE=$2
}

split_by_colon () {
KEY=$1
shift
VALUE=$@
}

FROMFILE=0

# Parsing Arguments
while [ "$1" != "" ]; do
    case "$1" in
	"-h" | "--help")
	    help
	    exit
	    ;;
        "-g" | "--group")
	    group=$2
	    ;;
	"-f" | "--pathtofile")
            FROMFILE=1
	    FILEPATH=$2
	    ;;
	"--")
	    break
	    ;;
	"*")
	    help
	    ;;
    esac
    shift 2
done




# Reading args from file
if [ $FROMFILE == "1" ]
then
    while read line; do
        KEY=''
        VALUE=''
        split_by_colon $line
        if [ "$KEY" == "group:" ] && ! [ -n "$group" ]
        then
            group=$VALUE
	fi
    done < "$FILEPATH"
fi

# Check if all required args were passed
if ! [ -n "$group" ];
then
    printf "Supply resource group: "
    read group
fi

region=$(az group show -n test --query "{location: location}" -o tsv)

echo Deleting contents of $group...
az group delete -n $group -y
az group create -n $group 
