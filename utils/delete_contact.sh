#!/bin/bash 
myfile="contacts"
delete_contact() {
        read -p "Enter the number of the contact that you want to delete : " number
        if grep -q ",$number$" "$myfile"; then
                echo "Contact found"
                [ -f "./chats/$number" ] && rm "./chats/$number"
                sed -i "/$number$/d" "$myfile"
                echo "Deleted contact" 
        else
                "Contact not found"
        fi
}

