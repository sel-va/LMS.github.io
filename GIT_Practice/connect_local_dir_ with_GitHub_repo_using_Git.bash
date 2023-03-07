#TO VIEW USERNAME AND PASSWORD
git config user.name
git config user.email

git config --list

vi ~/.gitconfig
:wq

#OR TO CHANGE

git config --global user.name "selva"
git config --global user.email "selva@gmail.com"

git clone [URL of GitHub repository]

#THEN CREATE AND ADD FILE
	git add filename
#or
	git add .
#or
	git  add -A

git commit -m "message"

git push

#TO UNLOAD FILE FROM STAGING AREA
git reset file_name 


#CONNECT A LOCAL DIRECTORY WITH A GITHUB REPOSITORY USING GIT

#Create a new directory in your local machine for the project.
#Open a terminal or command prompt in the new directory.
#Run the following command to initialize a Git repository in the directory:

git init
git remote add origin [URL of GitHub repository]
git remote -v
git fetch origin
git merge origin/master

