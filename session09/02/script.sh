#!/usr/bin/env bash

help () {
cat << EOF

  -h | --help            Prints this message
  -r | --region          Region of the storage account
  -n | --name            Name of the storage account
  -s | --sku             Pricing tier of the disk
  -g | --group           Resource group of the storage account
  -t | --tier            Pricing tier of the storage account
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
	"-r" | "--region")
	    region=$2
	    ;;
	"-s" | "--sku")
	    sku=$2
	    ;;
	"-t" | "--tier")
	    tier=$2
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
        if [ "$KEY" == "name:" ] && ! [ -n "$name" ]
        then
            name=$VALUE
	fi
        if [ "$KEY" == "group:" ] && ! [ -n "$group" ]
        then
            group=$VALUE
	fi
        if [ "$KEY" == "region:" ] && ! [ -n "$region" ]
        then
            region=$VALUE
	fi
        if [ "$KEY" == "sku:" ] && ! [ -n "$sku" ]
        then
            sku=$VALUE
	fi
        if [ "$KEY" == "tier:" ] && ! [ -n "$tier" ]
        then
	    tier=$VALUE
	fi
    done < "$FILEPATH"
fi

# Check if all required args were passed
if ! [ -n "$name" ];
then
    printf "Supply price tier of the vm os disk: "
    read name
fi

if ! [ -n "$group" ];
then
    printf "Supply VNet name: "
    read group
fi

if ! [ -n "$region" ];
then
    printf "Supply name of the vm: "
    read region
fi

if ! [ -n "$sku" ];
then
    printf "Supply name of the OS image: "
    read sku
fi

if ! [ -n "$tier" ];
then
    printf "Supply ptrice tier of the VM: "
    read tier
fi

az storage account create --name $name --sku $sku --resource-group $group --access-tier $tier
