#!/usr/bin/env bash

help () {
cat << EOF

  -h | --help            Prints this message
  -d | --disktier        Tier of the os disk
  -n | --vmname          Name of the virtual machine
  -i | --vmimage         Imge of the OS
  -z | --size            Pricing tier of the VM
  -e | --vnetname        Name of the VNet
  -s | --subnetname      Name of the subnet
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
        "-d" | "--disktier")
	    DISKTIER=$2
	    ;;
        "-n" | "--vmname")
	    VMNAME=$2
	    ;;
	"-i" | "--vmimage")
	    VMIMAGE=$2
	    ;;
	"-z" | "--size")
	    SIZE=$2
	    ;;
	"-e" | "--vnetname")
	    VNETNAME=$2
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
        if [ "$KEY" == "diskTier:" ] && ! [ -n "$DISKTIER" ]
        then
            DISKTIER=$VALUE
	fi
        if [ "$KEY" == "vmName:" ] && ! [ -n "$VMNAME" ]
        then
            VMNAME=$VALUE
	fi
        if [ "$KEY" == "vmImage:" ] && ! [ -n "$VMIMAGE" ]
        then
            VMIMAGE=$VALUE
	fi
        if [ "$KEY" == "size:" ] && ! [ -n "$SIZE" ]
        then
            SIZE=$VALUE
	fi
        if [ "$KEY" == "vnetName:" ] && ! [ -n "$VNETNAME" ]
        then
            VNETNAME=$VALUE
	fi
        if [ "$KEY" == "subnetName:" ] && ! [ -n "$SUBNETNAME" ]
        then
            SUBNETNAME=$VALUE
	fi
    done < "$FILEPATH"
fi

# Check if all required args were passed
if ! [ -n "$DISKTIER" ];
then
    printf "Supply price tier of the vm os disk: "
    read DISKTIER
fi

if ! [ -n "$VNETNAME" ];
then
    printf "Supply VNet name: "
    read VNETNAME
fi

if ! [ -n "$VMNAME" ];
then
    printf "Supply name of the vm: "
    read VMNAME
fi

if ! [ -n "$VMIMAGE" ];
then
    printf "Supply name of the OS image: "
    read VMIMAGE
fi

if ! [ -n "$SIZE" ];
then
    printf "Supply ptrice tier of the VM: "
    read SIZE
fi

if ! [ -n "$SUBNETNAME" ];
then
    printf "Supply name of the subnet: "
    read SUBNETNAME
fi

# Execute az commands

#if [ ${DISKTIER::1}=='S' ]; then
    #az disk create --name ${VMNAME}_disk --size-gb 30 --resource-group build-agents-01 --tier ${DISKTIER/[S]/P}
    #az disk update -n ${VMNAME}_disk -g build-agents-01  --sku Standard_LRS
#else
    #az disk create --name ${VMNAME}_disk --size-gb 30 --resource-group build-agents-01 --tier $DISKTIER
#fi

az vm create --name $VMNAME --generate-ssh-keys --storage-sku $DISKTIER --image $VMIMAGE --vnet-name $VNETNAME --subnet $SUBNETNAME --size $SIZE $RESIP $PUBNAME

