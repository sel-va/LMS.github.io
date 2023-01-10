#GIT TASK THREE - Make 2 branch, Make conflict merge, Compare the code & Fix it with vimdiff, delete used branch

$ git branch user1
$ git branch user2
$ git branch
* main
  user1
  user2

$ git checkout user1
$ git add GIT_level_one.bash
$ git status -s
M  GIT_level_one.bash

$ git commit -m "user1 first commit"
$ git checkout main
$ git merge user1
$ git checkout user1
$ git checkout user2
$ git status -s
?? GIT_level_two.bash

$ git add GIT_level_two.bash
$ git commit -m "user2 first commit"

$ git checkout main
$ git merge user2
#Auto-merging GIT_Practice/GIT_level_two.bash
#CONFLICT (add/add): Merge conflict in GIT_Practice/GIT_level_two.bash
#Automatic merge failed; fix conflicts and then commit the result.

# cat GIT_level_two.bash  --not recommended to use, bcoz its open big doc in cmd line


$ git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false

$ git mergetool
# git mergetool => to compare and view
# ctrl shift w or ctrl caps w (press two times) => move inside merge tool to edit
# 10 times esc button => reset model
# :diffg RE or BA or LO  (select file by using first two letter from REMOTE/BASE/LOCAL )
# :wqa  => two quit all window

$ git status -s
M  GIT_level_two.bash
?? GIT_level_two.bash.orig

$ ls -lrt
total 16
-rw-r--r-- 1 USER 197121 1617 Jan 10 17:49  GIT_level_one.bash
-rw-r--r-- 1 USER 197121 1441 Jan 10 17:50  GIT_level_two.bash.orig
-rw-r--r-- 1 USER 197121 1400 Jan 10 18:07  GIT_level_two.bash

$ rm -rf GIT_level_two.bash.orig
$ ls -lrt
$ git commit -m "conflict resolved"
$ git status -s
$ git push

$ git branch
* main
  user1
  user2

$ git branch -d user1
$ git branch -d user2

$ git branch
* main

$ git log