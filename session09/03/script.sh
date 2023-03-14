#!/usr/bin/env bash

help () {
cat << EOF

  -h | --help            Prints this message
  -a | --asname          App Service Name
  -s | --saname          Storage account name
  -u | --sasurl          Web App name
  -g | --group           Resource group of the storage account
  -c | --schedule        Schedule of backups
  -r | --retention       How long (in days) backups will be stored
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
	    #TODO saname
        "-s" | "--saname")
	    saname=$2
	    ;;
        "-g" | "--group")
	    group=$2
	    ;;
	"-a" | "--asname")
	    asname=$2
	    ;;
	"-u" | "--sasurl")
	    sasurl=$2
	    ;;
	"-c" | "--schedule")
	    schedule=$2
	    ;;
	"-r" | "--retention")
	    schedule=$2
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
        if [ "$KEY" == "saname:" ] && ! [ -n "$saname" ]
        then
            saname=$VALUE
	fi
        if [ "$KEY" == "group:" ] && ! [ -n "$group" ]
        then
            group=$VALUE
	fi
        if [ "$KEY" == "asname:" ] && ! [ -n "$asname" ]
        then
            asname=$VALUE
	fi
        if [ "$KEY" == "sasurl:" ] && ! [ -n "$waname" ]
        then
            sasurl=$VALUE
	fi
        if [ "$KEY" == "schedule:" ] && ! [ -n "$schedule" ]
        then
	    schedule=$VALUE
	fi
        if [ "$KEY" == "retention:" ] && ! [ -n "$retention" ]
        then
	    retention=$VALUE
	fi
    done < "$FILEPATH"
fi

# Check if all required args were passed
if ! [ -n "$saname" ];
then
    printf "Supply name of the Service Account: "
    read saname
fi

if ! [ -n "$group" ];
then
    printf "Supply resource group: "
    read group
fi

if ! [ -n "$asname" ];
then
    printf "Supply name of the App Service: "
    read asname
fi

if ! [ -n "$sasurl" ];
then
    printf "Supply URL of the storage account container: "
    read sasurl
fi

if ! [ -n "$schedule" ];
then
    printf "Supply schedule: "
    read schedule
fi

if ! [ -n "$retention" ];
then
    printf "Supply retention: "
    read retention
fi


#sas=$(az storage account show-connection-string -n $saname -o yaml)
#VALUE=''
#KEY=''
#split_by_colon $sas
#sasurl=VALUE

echo $sasurl

echo Creating backup plan...
az webapp config backup create -g $group --webapp-name $asname --webapp-name $asname --container-url $sasurl -o none
echo Updating config...
az webapp config backup update -g $group --webapp-name $asname --container-url $sasurl --retention $retention --frequency $schedule --retain-one False -o none

