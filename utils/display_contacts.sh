display_contacts() {
        echo -e "\n"
        echo -e "Name    | Number\n---------------------"  # echo -e means that echo can interpret that backslash (\)
        while IFS=',' read -r name number; do  # IFS means internal field separator (comma)
                        # read -r 'name' 'number' tells the bash scripts to split each line of the file into (name/num)
        echo -e "${name}\t| ${number}"  # <<<  that then allows us to print this 
    done < contacts  # redirects the contect of contacts.txt as input to the while loops
    echo -e "\n" 
}
# Call the function

