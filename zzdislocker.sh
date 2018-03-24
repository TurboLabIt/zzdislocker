#!/bin/bash
clear

## Script name
SCRIPT_NAME=zzdislocker

## Title and graphics
FRAME="O===========================================================O"
echo "$FRAME"
echo "      $SCRIPT_NAME - $(date)"
echo "$FRAME"

## Enviroment variables
TIME_START="$(date +%s)"
DOWEEK="$(date +'%u')"
HOSTNAME="$(hostname)"

## Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT_FULLPATH=$(readlink -f "$0")
SCRIPT_HASH=`md5sum ${SCRIPT_FULLPATH} | awk '{ print $1 }'`

## Absolute path this script is in, thus /home/user/bin
SCRIPT_DIR=$(dirname "$SCRIPT_FULLPATH")/

## Config files
CONFIGFILE_NAME=$SCRIPT_NAME.conf
CONFIGFILE_FULLPATH_DEFAULT=${SCRIPT_DIR}$SCRIPT_NAME.default.conf
CONFIGFILE_FULLPATH_ETC=/etc/turbolab.it/$CONFIGFILE_NAME
CONFIGFILE_FULLPATH_DIR=${SCRIPT_DIR}$CONFIGFILE_NAME

## Title printing function
function printTitle
{
    echo ""
    echo "$1"
    printf '%0.s-' $(seq 1 ${#1})
    echo ""
}

## root check
if ! [ $(id -u) = 0 ]; then

		echo ""
		echo "vvvvvvvvvvvvvvvvvvvv"
		echo "Catastrophic error!!"
		echo "^^^^^^^^^^^^^^^^^^^^"
		echo "This script must run as root!"

		printTitle "How to fix it?"
		echo "Execute the script like this:"
		echo "sudo $SCRIPT_NAME"

		printTitle "The End"
		echo $(date)
		echo "$FRAME"
		exit
fi


printTitle "Read config (if any)"
for CONFIGFILE_FULLPATH in "$CONFIGFILE_FULLPATH_DEFAULT" "$CONFIGFILE_MYSQL_FULLPATH_ETC" "$CONFIGFILE_FULLPATH_ETC" "$CONFIGFILE_FULLPATH_DIR" "$CONFIGFILE_PROFILE_FULLPATH_ETC" "$CONFIGFILE_PROFILE_FULLPATH_DIR"
do
	if [ -f "$CONFIGFILE_FULLPATH" ]; then
		source "$CONFIGFILE_FULLPATH"
	fi
done

printTitle "Creating folders"
DISLOCKER_MOUNT_FULLPATH=/media/dislocker/dislocked/
MYDRIVE_MOUNT_FULLPATH=/media/dislocker/MYDRIVE/

mkdir -p "$DISLOCKER_MOUNT_FULLPATH"
mkdir -p "$MYDRIVE_MOUNT_FULLPATH"

printTitle "Detecting Bitlocked disk"
FDISK="$(fdisk -l | grep 'HPFS/NTFS/exFAT')"
ZZDISK="$(echo $FDISK | grep -Po '/\Ksd[a-z][0-9]')"

if [ -z "$ZZDISK" ]; then

	printTitle "Disk detection FAILED"
	echo "Unable to detect a Bitlocked Windows drive. Now exiting. Please open an issue on https://github.com/TurboLabIt/${SCRIPT_NAME}"

	echo $(date)
	echo "$FRAME"
	exit
else
	printTitle "Bitlocked drive DETECTED"
	echo "Will now mount $ZZDISK ($FDISK)"
fi

printTitle "Dislocking"
dislocker -V /dev/${ZZDISK} -u"${BITLOCKER_PASSWORD}" -- "${DISLOCKER_MOUNT_FULLPATH}"

printTitle "Attempting mount"
mount -o loop "${DISLOCKER_MOUNT_FULLPATH}dislocker-file" "${MYDRIVE_MOUNT_FULLPATH}"

printTitle "Finish"
echo "Your unlocked drive is available as ${MYDRIVE_MOUNT_FULLPATH}"
echo $(date)
echo "$FRAME"
