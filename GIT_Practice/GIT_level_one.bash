#GIT TASK ONE - clone central repositry then Create one folder then make new file, add, commit - soft merge, push that.
  #Create a new local Git repository and add then remove a file to it.
  #Clone a remote Git repository to your local machine.
  #Make changes to a file in your local repository and commit the changes.
  #Push your local repository to a remote repository on a Git hosting service (e.g. GitHub).

$ git --version
$ pwd
#/c/Users/USER

$ cd /d/LMS/LMS.github.io/

#Create a new local Git repository and add then remove a file to it.
$ PWD
$ ls -lrt
$ mkdir JAVA
$ ls -lrt
$ rm -Rf JAVA
$ ls -lrt

#Clone a remote Git repository to your local machine.
$ git clone https://github.com/sel-va/LMS.github.io.git

$ git init
$ git commit -m "First commit"
#Author identity unknown

$ git config --global user.name "sel-va"
$ git config --global user.email "er.ks.selva@gmail.com"

#Create a new local Git repository and add a file to it then
#Make changes to a file in your local repository and commit the changes.

$ git branch
$ cd LMS.github.io
$ cd ..
$ ls -lrta
$ cd LMS.github.io/
$ mkdir PLSQL
$ cd plsql
$ vi PLSQL_questions.sql
$ git status -s
$ git add PLSQL_questions.sql
$ git log
$ git status -s
$ git add PLSQL_questions.sql
$ git status
$ vi PLSQL_questions.sql
#paste text
#:wq!
$ git add PLSQL_questions.sql
$ git commit -m "direct commit"
$ git status
$ git add PLSQL_questions.sql
$ git status
$ git commit -m "calc procedure added"
$ git status -s
$ git push
$ git push
#Everything up-to-date
$ git log
$ git log --oneline
