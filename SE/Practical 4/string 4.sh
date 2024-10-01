#!/bin/bash
string="Hello, World!"
echo ${#string}  

string="Hello, World!"
echo ${string:7:5} 

string="Hello, World!"
echo ${string/World/Bash}  

string="Hello, World!"
echo $(echo "$string" | tr '[:lower:]' '[:upper:]')  

string="Hello, World!"
echo $(echo "$string" | tr '[:upper:]' '[:lower:]')  

