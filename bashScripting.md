What is Shell?

What is Bash?
bash is called born Again Shell.

What is Shell Scripting?


What is sh?
sh is born shell.


Write a bash Script to print Hello.
#! /bin/bash
echo "Hello"

Command to make a file executable?
"chmod +x filename" is the command to make the file executable.

How to run a shell Script?
./filename to execute the shell script.

## Comments in Shell Script:
# this is a single comment and is not executed.
any text after the # is not executed


## Variables in Schell Scripting:
Variables are used for storing the data with a name for reuse.

ex: echo $BASH # BASH is the variable and prints /bin/bash
There are 2 types of Variables:
	* System Variable
		ex: BASH, HOME, BASH_VERSION, PWD etc
	* User Defined Variables.
		name=Rahmath
		echo $name #name is a variable and Rahmath is the value of the variable.

# Inputs
How to take inputs?
"read variable-name"

How to take inputs on same line?
read -p variable-name 
	* ex: read -p 'Username : ' uname_var
	echo $uname_var

How to hide the entered text value?
"read -s varaible_name"

How to read array of String?
read -a variable_name

How to print 1st element of the array?
echo ${variable_name[0]}

## Arguments
How to Pass Arguments to Script?
./filename.sh arg1 arg2 arg3 ...

How to print or store the arguments?
"name = $1" # $1 has the value of 1st argument passed while executing the script
	* ex: echo 'Hello ' $1 $2 ...
	./Hello.sh Rahmath Hussain

How to print no of arguments passed?
echo $#

How to take all the Arguments as an array?
args = ("$@")
	echo ${args[1]} #this prints the 1st arg

	
## Conditions
### if syntax
if [ condition ]
then 
	statement
fi


## Running script
./script.sh 

Enabling Openssh