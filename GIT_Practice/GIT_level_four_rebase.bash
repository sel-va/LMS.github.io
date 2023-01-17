#GIT TASK THREE - Make 2 branch, Make conflict merge, REBASE the central repositry

git log --oneline

# create a new branch named branch1
git branch branch1

# create another new branch named branch2
git branch branch2

# switch to branch1
git checkout branch1

# make some changes to a file
vi file.txt

# commit the changes
git add file.txt
git commit -am "1st commit from branch1"

# switch to branch2
git checkout branch2

# make some different changes to the same file
vi file.txt

# commit the changes
git add file.txt
git commit -am "2nd time 1st commit from branch2"

#-------------------------------------------------------------
git merge branch1

git checkout main

git log --oneline

#use last commit_ID to view last commit details (by whome)
git show f804ecd

# To rebase we need to switch branch2
git checkout branch2
git rebase main

git checkout main
git merge branch2

git push
---------------------------------------------------------------------------------------
# other way to rebase from commited branch2
# switch back to branch1
git checkout branch1
git branch

# merge branch2 into branch1
git merge branch2

---------------------------------------------------------
#other topic
# update the master branch with the latest changes from the remote repository
git pull origin main

