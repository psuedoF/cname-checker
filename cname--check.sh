#!/bin/bash



# Define color codes for green

GREEN="\033[0;32m"

NC="\033[0m"  # No color



# Ask for the filename containing the hostnames

read -p "Enter the filename containing hostnames: " filename



# Check if the file exists

if [[ ! -f "$filename" ]]; then

    echo "Error: File '$filename' not found."

    exit 1

fi



# Loop through each line in the file and perform full 'dig' on each hostname

while IFS= read -r hostname; do

    if [[ -n "$hostname" ]]; then  # Skip empty lines

        echo -e "${GREEN}Hostname: $hostname${NC}"

        dig "$hostname"  # Perform the full dig command

        echo -e "${GREEN}-----------------------------------------------------${NC}"

    fi

done < "$filename"

