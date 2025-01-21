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

        echo -e "\n1 View Messages\n2 Text Contact\n3 Display Contacts\n4 Search for Contact\n5 Add Contact\n6 Update user\n7 Delete Contact \n8 Exit"
        read -p "Enter your choice: " ch
        case $ch in
                2) text_contact "$user";;
                3) display_contacts;;
                4) search_contacts;;
                5) add_contact;;
                6) update_contact;;
                7) delete_contact;;
                8) break;;
                *) echo "Options not yet added...";;
        esac
done

