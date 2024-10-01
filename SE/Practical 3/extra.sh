#!/bin/bash

# Function to display system information
display_system_info() {
    echo "System Information:"
    uname -a
    echo
}

# Function to list files in a directory with detailed information
list_files() {
    local dir=${1:-.}
    echo "Listing files in directory: $dir"
    ls -lh "$dir"
    echo
}

# Function to show current date and time
show_date_time() {
    echo "Current Date and Time:"
    date
    echo
}

# Function to display disk usage
display_disk_usage() {
    echo "Disk Usage:"
    df -h
    echo
}

# Menu for user to select functions
echo "Select an option:"
echo "1. Display system information"
echo "2. List files in a directory"
echo "3. Show current date and time"
echo "4. Display disk usage"
read -p "Enter choice (1/2/3/4): " choice

case $choice in
    1)
        display_system_info
        ;;
    2)
        read -p "Enter directory path (default is current directory): " dir
        list_files "$dir"
        ;;
    3)
        show_date_time
        ;;
    4)
        display_disk_usage
        ;;
    *)
        echo "Invalid choice"
        ;;
esac
