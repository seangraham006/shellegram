#! /bin/bash
source './utils/text_contact.sh'
source './utils/search_contacts.sh'
source './utils/add_contact.sh'
source './utils/display_contacts.sh'
source './utils/update_contact.sh'
source './utils/delete_contact.sh'
source './utils/view_messages.sh'

! [ -f "contacts" ] && touch contacts
cat "introart"
echo -e "\n---- Welcome back to Shellegram!! ----\n"

user="You,007"

while true; do
	view_messages "$user"

        echo -e "\n1 Text Contact\n2 Display Contacts\n3 Search for Contact\n4 Add Contact\n5 Update user\n6 Delete Contact \n7 Exit"
        read -p "Enter your choice: " ch
        case $ch in
                1) 
			display_contacts
			text_contact "$user";;
                2) display_contacts;;
                3) search_contacts;;
                4) add_contact;;
                5) update_contact;;
                6) delete_contact;;
                7) break;;
                *) echo "Options not yet added...";;
        esac
done

