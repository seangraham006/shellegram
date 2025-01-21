#! /bin/bash

get_messages() {
	#  $1 = filename  $2 = number $3 = name (optional)
	[ $# -lt 1 ] && { echo "Error: file name and phone number must be passed in"; return 1; }

	! [ -f "$1" ] && { echo "Error: file $1 does not exist"; return 1; }
	#search to find name and number not just number
	cat "$1"
}
