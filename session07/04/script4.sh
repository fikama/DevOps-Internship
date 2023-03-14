#!/usr/bin/env bash

help () {
cat << EOF

  -h | --help            Prints this message
  -v | --vnetname        Region (remember to escape the space)
  -n | --nsgname         Name of the VNet
  -s | --subnetname      VNet's address space (e.g. 10.0.0.0/16)
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

# Parsing AArguments
while [ "$1" != "" ]; do
    case "$1" in
	"-h" | "--help")
	    help
	    exit
	    ;;
        "-v" | "--vnetname")
	    VNETNAME=$2
	    ;;
        "-n" | "--nsgname")
	    NSGNAME=$2
	    ;;
	"-s" | "--subnetname")
	    SUBNETNAME=$2
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
        if [ "$KEY" == "subnetname:" ] && ! [ -n "$SUBNETNAME" ]
        then
            SUBNETNAME=$VALUE
	fi
        if [ "$KEY" == "vnetname:" ] && ! [ -n "$VNETNAME" ]
        then
            VNETNAME=$VALUE
	fi
        if [ "$KEY" == "nsgname:" ] && ! [ -n "$NSGNAME" ]
        then
            NSGNAME=$VALUE
	fi
    done < "$FILEPATH"
fi

# Check if all required args were passed
if ! [ -n "$SUBNETNAME" ];
then
    printf "Supply subnet name: "
    read SUBNETNAME
fi

if ! [ -n "$VNETNAME" ];
then
    printf "Supply VNet name: "
    read VNETNAME
fi

if ! [ -n "$NSGNAME" ];
then
    printf "Supply NSG name: "
    read NSGNAME
fi


# Execute az commands
az network vnet subnet update -n "$SUBNETNAME" --vnet-name "$VNETNAME" --network-security-group "$NSGNAME"

