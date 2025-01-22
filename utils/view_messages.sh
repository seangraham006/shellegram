#! /bin/bash

folder="./chats"

LIGHT_BLUE="\033[94m"   # Light blue for user messages
GREEN="\033[92m"        # Green for contact messages
RESET="\033[0m"         # Reset color

view_messages() {
	user="$1"
	username=$(echo "$user" | awk -F, '{print $1}')
        usernumber=$(echo "$user" | awk -F, '{print $2}')
        [ -z "$username" ] && user_identifier="$usernumber" || user_identifier="$username"

	ls -t "$folder" | head -n 5 | while read -r file; do
		contact_info=$(grep ",$file$" "contacts")
		
		name=$(echo "$contact_info" | awk -F, '{print $1}')
		[ -z "$name" ] && identifier="$file" || identifier="$name"
		echo -e "\nChat with $identifier"
		
		last_two_lines=$(tail -n 2 "$folder/$file")

		echo "$last_two_lines" | while read -r line; do
			case "$line" in
				1:*) sender="$user_identifier"; indent="false"; message="$(echo "$line" | awk -F: '{print $2}')" ;;
				2:*) sender="$identifier"; indent="true"; message="$(echo "$line" | awk -F: '{print $2}')" ;;
				*) continue ;;
			esac
		
			if [[ "$indent" == "true" ]]; then
			    echo -e "$GREEN$sender: $message$RESET"
			else
			    echo -e "$LIGHT_BLUE$sender: $message$RESET"
			fi
		done
	done

}
