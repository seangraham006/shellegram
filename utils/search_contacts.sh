#! /bin/bash 
myfile="contacts"
search_contacts() 
{
        read -p "Choose to search either by name (1) or number (2) : " choice
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
                        if grep -q ",$number$" "$myfile"; then
                                echo "Contact found" 
                                grep ",$number$" "$myfile"
                        else
                                echo "No contact found with contact number $number" 
                        fi
                        ;;
                *)
                        echo "invalid input"
        esac
}
