#!/usr/bin/env bash

help () {
cat << EOF

  -h | --help            Prints this message
  -n | --name            Name of the app service
  -g | --group           Resource group of the app service 
  -r | --region          Region iof the app service
  -s | --sku             Pricing tier of the app service
  -d | --dockerimage     Docker image from docker hub
  -o | --numberofnodes   Number of nodes in app service
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
        "-n" | "--name")
	    name=$2
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
	"-d" | "--dockerimage")
	    dockerImage=$2
	    ;;
	"-o" | "--numberofnodes")
	    numberOfNodes=$2
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
        if [ "$KEY" == "dockerImage:" ] && ! [ -n "$dockerImage" ]
        then
	    dockerImage=$VALUE
	fi
        if [ "$KEY" == "numberOfNodes:" ] && ! [ -n "$numberOfNodes" ]
        then
            numberOfNodes=$VALUE
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

if ! [ -n "$dockerImage" ];
then
    printf "Supply ptrice tier of the VM: "
    read dockerImage
fi

if ! [ -n "$numberOfNodes" ];
then
    printf "Supply name of the subnet: "
    read nubmerOfNodes
fi

app_name=

az appservice plan create --name $name --is-linux --resource-group $group --location $region --sku $sku  --number-of-workers $numberOfNodes
az webapp create --name ${name,,}-webapp --plan $name --resource-group $group -i $dockerImage
