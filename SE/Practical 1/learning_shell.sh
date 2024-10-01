#!/bin/bash

echo "home directory"
cd ~

echo "Going up one directory level"
cd ..

echo "new directory"
mkdir testdir

echo "Listing contents of the current directory"
ls

echo "Removing the directory 'testdir'"
rmdir testdir

echo "Creating a file named 'testfile.txt'"
touch testfile.txt
echo "Removing the file 'testfile.txt'"
rm testfile.txt

echo "Creating a new directory named 'sourcedir'"
mkdir sourcedir
echo "Creating a file named 'sourcefile.txt' in 'sourcedir'"
touch sourcedir/sourcefile.txt
echo "Copying 'sourcefile.txt' to 'destfile.txt'"
cp sourcedir/sourcefile.txt destfile.txt

echo "Renaming 'destfile.txt' to 'renamedfile.txt'"
mv destfile.txt renamedfile.txt

echo "Creating a file 'myfile.txt' with some content"
echo "Hello, World!" > myfile.txt
echo "Displaying the content of 'myfile.txt'"
cat myfile.txt

echo "Viewing the content of 'myfile.txt' with less"
less myfile.txt

echo "Editing 'myfile.txt' with nano"
notepad myfile.txt

# echo "Updating package lists with sudo"
# sudo apt-get update

# echo "Upgrading installed packages with sudo"
# sudo apt-get upgrade

# echo "Installing a package (curl) with sudo"
# sudo apt-get install curl

# echo "Removing a package (curl) with sudo"
# sudo apt-get remove curl

echo "Viewing currently running processes"
ps

echo "Displaying real-time system resources"
top -n 1

echo "Displaying disk usage"
df

echo "Displaying disk usage in human-readable format"
df -h

echo "Displaying directory usage"
du

echo "Displaying directory usage of 'sourcedir' in human-readable format"
du -sh sourcedir

echo "Displaying network configuration"
ifconfig

echo "Checking network connectivity to 'google.com'"
ping -c google.com

echo "Downloading a file from a URL"
wget https://filesamples.com/samples/document/txt/sample3.txt

#  curl: Fetch contents from a URL
echo "Fetching contents from a URL"


curl 'https://coepresult.vercel.app/api/data' --data-raw '{"semester":4,"yearOfStudy":"SY","mis":"612203036"}'


#  chmod: Change file permissions
echo "Changing file permissions
