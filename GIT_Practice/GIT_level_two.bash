#other topic
# update the master branch with the latest changes from the remote repository
git pull origin main

#----------------------------------------------------------------------------------------------------------

#GIT TASK TWO - Make 2 branch, Make soft merge, Push it to a remote repository
  #Create a new branch in your repository and make changes to it.
  #Merge the changes from the new branch back into the master branch.
  #Push your local repository to a remote repository on a Git hosting service (e.g. GitHub).
  #Delete that new branch in your repository
        #You no longer need to keep and use that branch, so it is a common best practice to delete it so it doesn't clutter up your code
			
$ git branch
* main

#Create a new branch in your repository and make changes to it.

$ git branch git_practice

$ git branch
  git_practice
* main

$ git checkout git_practice
		$ git branch
		* git_practice
		  main

		$ ls -lrt
		$ cd plsql
		$ pwd
		#/d/LMS/LMS.github.io/plsql

		$ ls -lrt
		$ git status
		$ git add plslq_code_to_print_calender.sql
		$ git status -s

		$ git commit -m "calender_plslq_code"
		$ git status -s

#Merge the changes from the new branch back into the master branch.
$ git checkout main
		$ git branch
		$ git merge git_practice

		$ git branch
		$ ls -lrt
		  
		#Push your local repository to a remote repository on a Git hosting service (e.g. GitHub).

		$ git status -s
		$ git push
		$ git branch
		$ git status -s

		#Delete that new branch in your repository

		$ git branch -d git_practice
		Deleted branch git_practice (was 0df4a91).

		$ git branch
		* main
