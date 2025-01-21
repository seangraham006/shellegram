#! /bin/bash

get_messages() {
	#  $1 = filename  $2 = number $3 = user $4 = name (optional)
	[ $# -lt 1 ] && { echo "Error: file name and phone number must be passed in"; return 1; }
	! [ -f "$1" ] && { echo "Error: file $1 does not exist"; return 1; }
	
	[ -z "$4" ] && identifier="$2" || identifier="$4"
	username=$(echo "$3" | awk -F, '{print $1}')
	usernumber=$(echo "$3" | awk -F, '{print $2}')
	[ -z "$username" ] && user_identifier="$usernumber" || user_identifier="$username"
	
	LIGHT_BLUE="\033[94m"   # Light blue for user messages
	GREEN="\033[92m"        # Green for contact messages
	RESET="\033[0m"         # Reset color
	echo
	while IFS= read -r line; do
		case "$line" in
			1:*) sender="$user_identifier"; indent="false"; message="$(echo "$line" | awk -F: '{print $2}')" ;;
			2:*) sender="$identifier"; indent="true"; message="$(echo "$line" | awk -F: '{print $2}')" ;;
			*) continue ;;
		esac
		
		if [[ "$indent" == "true" ]]; then
		    echo -e "$GREEN                                    $sender: $message$RESET"
		else
		    echo -e "$LIGHT_BLUE$sender: $message$RESET"
		fi
	done < "$1"
	echo
}
