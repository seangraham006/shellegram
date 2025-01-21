#!/bin/bash
myfile="contacts"
add_contact()
{
        read -p "Enter the number of the contact you would like to add to add to the contacts :  " number
                 if grep -q ",$number$" "$myfile"; then
                        echo "The contact you are trying to add already exists with the following details" 
                        grep ",$number$" "$myfile"
                else
                        read -p "Would you like to add a contact name with this number? (Y/N) : " ans
                        if [[ "$ans" = "Y" ]]; then
                                read -p "Enter the name : " name
                                name="${name,,}"
                                name="${name^}"
                                echo "$name,$number" >> "$myfile"
                        else
                                echo ",$number" >> "$myfile" 
                        fi
                 fi
}

