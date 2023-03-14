#!/usr/bin/env bash

help () {
cat << EOF

  -h | --help            Prints this message
  -r | --region          Region (remember to escape the space)
  -n | --nsgname         Name of the NSG
  -u | --rules           Array of rules
                         (for parameters see `az network nsg rule create --help`)
  -f | --pathtofile      Supply values from file, you can overwrite
                         settings from file using flags

EOF
}

split_by_colon () {
KEY=$1
shift
VALUE=$@
}

FROMFILE=0

# Parsing AArguments
# TODO: Fix variable names
while [ "$1" != "" ]; do
    case "$1" in
	"-h" | "--help")
	    help
	    exit
	    ;;
        "-r" | "--region")
	    REGION=$2
	    ;;
	"-n" | "--nsgname")
	    VNETNAME=$2
	    ;;
	"-u" | "--rules")
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
	    #TODO: case switch instead of if's
        KEY=''
        VALUE=''
        split_by_colon $line
        if [ "$KEY" == "nsgname:" ] && ! [ -n "$NSGNAME" ]
        then
            NSGNAME=$VALUE
	fi
        if [ "$KEY" == "rules:" ] && ! [ -n "$RULES" ]
        then
            RULES=$VALUE
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

if ! [ -n "$NSGNAME" ];
then
    printf "Supply NSG name: "
    read NSGNAME
fi

if ! [ -n "$RULES" ];
then
    printf "Supply rules arguments sparated by ,: "
    read RULES
fi


# Execute az commands
az network nsg create --name $NSGNAME --location "$REGION"

# SUBNETS string to dictionary convrsion
while read -d ',' line || [ -n "$line" ]; do
    az network nsg rule create --nsg-name $NSGNAME $line
done <<< $RULES

