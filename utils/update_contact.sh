#! /bin/bash
myfile="contacts"
update_contact() {
    echo -e "1 Search by Name\n2 Search by Number"
    read -p "Enter your choice: " ch
    case $ch in
        1)
            read -p "Enter the name you'd like to search: " name
            contact=$(grep "^${name}," "$myfile");;
        2)
            read -p "Enter the number you'd like to search: " number
            contact=$(grep ",${number}$" "$myfile");;
        *)
            echo "Invalid choice"
            return;;
    esac
    [ -z "$contact" ] && { echo "No matching contact found"; return; }
    name=$(echo "$contact" | cut -d, -f1)
    number=$(echo "$contact" | cut -d, -f2)
    while true; do
        echo -e "\nContact: '$contact' --> New Contact: '$name,$number'"
        echo -e "\n1 Update Name\n2 Update Number\n3 Save Changes & Exit\n4 Discard Changes & Exit\n"
        read -p "Enter your choice: " ch
        case $ch in
            1)
                read -p "Enter new name: " temp_name
                if grep -q "^${temp_name}," "$myfile"; then
                    echo "Name: $temp_name already exists"
                    continue
                else
                    name="$temp_name"
                fi
                ;;
            2)
                read -p "Enter new number: " temp_number
                if grep -q ",${temp_number}$" "$myfile"; then
                    echo "Number: $temp_number already exists"
                    continue
                else
                    [ -f "./chats/$number" ] && mv "./chats/$number" "./chats/$temp_number"
                    number="$temp_number"
                fi
                ;;
            3)
                break;;
            4)
                name=$(echo "$contact" | cut -d, -f1)
                number=$(echo "$contact" | cut -d, -f2)
                break;;
            *)
                echo "Invalid Option";;
        esac
    done
    newcontact="$name,$number"
    sed -i "s/^${contact}$/${newcontact}/" "$myfile"
}

