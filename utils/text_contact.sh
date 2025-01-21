#! /bin/bash 

source './utils/get_messages.sh'
source './utils/search_contacts.sh'

text_contact() {
	user="$1"
	search_contacts s
	[ -f "tempdata" ] && recipient=$(cat "tempdata") || return 1
	recipient_name=$(echo "$recipient" | awk -F, '{ print $1 }')
	recipient_number=$(echo "$recipient" | awk -F, '{ print $2 }')
	recipient_file="./chats/$recipient_number"
	! [ -f "$recipient_file" ] && { touch "$recipient_file"; echo -e "\nNo messages yet\n"; } || get_messages "$recipient_file" "$recipient_number" "$recipient_name"
	read -p "Enter your message: " message
	! [ -z "$message" ] && echo "$user:$message" >> "$recipient_file"
	echo
	get_messages "$recipient_file" "$recipient_number" "$recipient_name"
}
