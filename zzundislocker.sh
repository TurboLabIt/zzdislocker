#!/bin/bash
clear

## Script name
SCRIPT_NAME=zzundislocker

## Title and graphics
FRAME="O===========================================================O"
echo "$FRAME"
echo "      $SCRIPT_NAME - $(date)"
echo "$FRAME"

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

printTitle "Unmounting"
DISLOCKER_MOUNT_FULLPATH=/media/dislocker/dislocked/
MYDRIVE_MOUNT_FULLPATH=/media/dislocker/MYDRIVE/

umount "$MYDRIVE_MOUNT_FULLPATH"
umount "$DISLOCKER_MOUNT_FULLPATH"

printTitle "Finish"
echo "You can now disconnect the drive"
