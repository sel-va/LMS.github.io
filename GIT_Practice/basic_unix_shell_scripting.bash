#BASIC UNIX SHELL SCRIPTING

# Print the current working directory
pwd
echo "Current directory: $(pwd)"
echo 'hello world'
echo -e 'hello \n world'
echo -e 'hello \t world'

# Lists the files and directories in the current directory
ls
ls -l
ll
ls -a
ls -lsrt
ls ???.*
ls *.txt

# Recursively list all the files and directories in a specific directory
ls -R 
ls -R /path/to/directory

# Changes the current working directory
cd /path/to/new/directory

# Creates a new directory (folder)
mkdir new_directory
mkdir folder_one folder_two folder_three
ls

#nested folder creation
mkdir -p folder_one/sub_folder/super_sub_folder

pwd
ls -R

# Removes an EMPTY directory
rmdir new_folder

# Removes directory with all files (recursive)
rm -r new_folder

# Creates a new file
touch new_file.txt
touch new_file.txt new_file_two.txt
ls

# Shows the contents of a file
cat /path/to/file.txt

# Shows the contents of a file
cat > sample.txt
This is sample text
#save and exit from that file 
#ctrl+D
cat sample.txt
#show text with number
cat -n sample.txt

#copy file
cat sample3.txt > copy.txt

# Copies a file or directory
cp /path/to/original_file.txt /path/to/copy_of_file.txt

# Moves or renames a file or directory
mv /path/to/original_file.txt /path/to/renamed_file.txt

# renames a file or directory
mv original.txt renamed.txt

#show text in reverse order
tac -n sample.txt

# Concatenate the contents of file1 and file4 and save the output in a new file
cat file1.txt file2.txt > file3.txt
cat file3.txt

# Shows the last lines of a file
tail /path/to/file.txt

# Shows the last 3 lines
tail -3 file.txt

# Shows the first lines of a file
head /path/to/file.txt

# Shows the first 5 lines
head -5 file.txt

# Opens a file for editing in the terminal
vi /path/to/file.txt
vi file_name.txt
	#escape mode
		#press ESC button
	#insert mode
		#press I button
:wq
:q
:wqa

#file word count
wc sample.txt

# Removes a file or directory
rm new_file.txt

# Searches for files and directories in a specified location
find /path/to/search -name "*.txt"

# Searches for a specified text pattern in a file or set of files
grep "text_pattern" /path/to/file.txt

# Edits text in a file or set of files
sed -i 's/old_text/new_text/g' /path/to/file.txt

# Shows the processes running on a system
ps

# Terminates a process
kill pid_number

# Shows the contents of a file one page at a time
less /path/to/file.txt

# Counts the number of lines, words, and characters in a file
wc /path/to/file.txt

# Changes the permissions of a file or directory
chmod 755 /path/to/file.txt

# Changes the owner and group of a file or directory
chown new_owner:new_group /path/to/file.txt

# Exports an environment variable
export NEW_VARIABLE="value"

# Creates a shorthand for a command
alias l='ls -l'

# Shows the location of a command
which command_name

# Shows the manual for a command
man command_name

# Shows all types of DATE Format
$ date '+%d/%m/%y'
15/01/23

$ date '+%d-%m-%y'
15-01-23

#Wrong format to print shows date-minute-year
$ date '+%D-%M-%Y'
01/15/23-43-2023

$ date +%D
01/15/23

$ date +%a
Sun

$ date +%A
Sunday

$ date +%b
Jan

$ date +%B
January

$ date '+%H-%M-%S'
09-44-26


#Show calender
cal
cal -3
