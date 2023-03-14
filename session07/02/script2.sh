#!/usr/bin/env bash

help () {
cat << EOF

  -h | --help            Prints this message
  -r | --region          Region (remember to escape the space)
  -n | --vnetname            Name of the VNet
  -a | --addressspace    VNet's address space (e.g. 10.0.0.0/16)
  -s | --subnets         Array of subnets 
                         (e.g. "sub1 10.0.0.0/24 sub2 10.0.1.0/24")
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
        "-r" | "--region")
	    REGION=$2
	    ;;
        "-a" | "--address")
	    ADDRESS=$2
	    ;;
	"-n" | "--vnetname")
	    VNETNAME=$2
	    ;;
	"-s" | "--subnets")
	    SUBNETS=$2
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
        if [ "$KEY" == "address:" ] && ! [ -n "$ADDRESS" ]
        then
            ADDRESS=$VALUE
	fi
        if [ "$KEY" == "vnetname:" ] && ! [ -n "$VNETNAME" ]
        then
            VNETNAME=$VALUE
	fi
        if [ "$KEY" == "subnets:" ] && ! [ -n "$SUBNETS" ]
        then
            SUBNETS=$VALUE
	fi
        if [ "$KEY" == "region:" ] && ! [ -n "$REGION" ]
        then
            REGION=$VALUE
	fi
    done < "$FILEPATH"
fi

# Check if all required args were passed
if ! [ -n "$REGION" ];
then
    printf "Supply region of VNet: "
    read REGION
fi

if ! [ -n "$VNETNAME" ];
then
    printf "Supply VNet name: "
    read VNETNAME
fi

if ! [ -n "$ADDRESS" ];
then
    printf "Supply VNets address space: "
    read ADDRESS
fi

if ! [ -n "$SUBNETS" ];
then
    printf "Supply subnets names separated by ,: "
    read SUBNETS
fi


# Execute az commands
az network vnet create --location "$REGION" --name $VNETNAME --address-prefix $ADDRESS

# SUBNETS string to dictionary convrsion
while read -d ',' line || [ -n "$line" ]; do
    KEY=''
    VALUE=''
    split_by_space $line
    az network vnet subnet create --name $KEY --vnet-name $VNETNAME --address-prefixes $VALUE
done <<< $SUBNETS

