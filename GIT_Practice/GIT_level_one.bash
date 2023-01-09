#GIT TASK ONE - clone central repositry then Create one folder then make new file, add, commit, push that.

$ git --version
$ pwd
#/c/Users/USER

$ git clone https://github.com/sel-va/LMS.github.io.git

$ cd /d/LMS/LMS.github.io/

$ PWD
$ ls -lrt
$ mkdir JAVA
$ ls -lrt
$ rm -Rf JAVA
$ ls -lrt

$ git init
$ git commit -m "First commit"
#Author identity unknown

$ git config --global user.name "sel-va"
$ git config --global user.email "er.ks.selva@gmail.com"

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


