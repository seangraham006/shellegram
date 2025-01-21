#! /bin/bash 

source './utils/get_messages.sh'

text_contact() {
	user="$1"
	#get recipient from add contact
	recipient=0000
	recipient_file="./chats/$recipient"
	! [ -f "$recipient_file" ] && { touch "$recipient_file"; echo -e "\nNo messages yet\n"; } || get_messages "$recipient_file"
	read -p "Enter your message: " message
	! [ -z "$message" ] && echo "$user:$message" >> "$recipient_file"
	echo
	get_messages "$recipient_file" "$recipient"
}
