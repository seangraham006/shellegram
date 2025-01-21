#! /bin/bash
source './utils/text_contact.sh'
source './utils/search_contacts.sh'
source './utils/add_contact.sh'

! [ -f "contacts" ] && touch contacts

user="You,007"

while true; do
	echo -e "\n1 View Messages\n2 Text Contact\n3 Display Contacts\n4 Search for Contact\n5 Add Contact\n6 Exit"
	read -p "Enter your choice: " ch
	case $ch in
		2) text_contact "$user";;
		4) search_contacts;;
		5) add_contact;;
		6) break;;
		*) echo "Options not yet added...";;
	esac
done
