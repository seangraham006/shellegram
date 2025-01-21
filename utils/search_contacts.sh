#! /bin/bash 
myfile="contacts"
temp="tempdata"
search_contacts() 
{
	suppress="false"
	[ $# -gt 0 ] && [[ "$1" == "s" ]] && suppress="true"
	[[ "$suppress" == "false" ]] && read -p "Choose to search either by name (1) or number (2) : " choice || choice=2 
	
	case $choice in
                1)
                        read -p "Enter the name of the contact you are searching for : " contactname
                        if grep -i -q "^$contactname," "$myfile"; then
                                echo "Contact found"
                                grep -i "^$contactname," "$myfile"
                        else
                                echo "No contact found with Contact name $contactname" 
                        fi
                        ;;
                2)
                        read -p "Enter the number of the contact you are searching for : " number
			contact_info=$(grep ",$number$" "$myfile")

                        if [ -n "$contact_info" ]; then
                                echo "Contact found: $contact_info"
			        [[ "$suppress" == "true" ]] && echo "$contact_info" > "$temp"	
                        else
                                echo "No contact found with contact number $number"
			       [[ "$suppress" == "true" ]] && [[ -f "$temp" ]] && rm "$temp"
                        fi
                        ;;
                *)
                        echo "invalid input"
        esac
}
