#GIT TASK THREE - Make 2 branch, Make conflict merge, REBASE the central repositry

#SIMPLE REBASE
=================

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
		git status -s
		git commit -am "1st commit from branch1"

		git checkout main
		git merge branch1

# switch to branch2
git checkout branch2

git checkout main
		git log --oneline

		#use last commit_ID to view last commit details (by whome)
		git show f804ecd

git checkout branch2
		git rebase main

		# make some different changes to the same file
		vi file.txt

		# commit the changes
		git add file.txt
		git commit -am "2nd time 1st commit from branch2"

git checkout main
		git merge branch1

#-------------------------------------------------------------
# other way to rebase from commited branch2
============================================

# switch back to branch1
git checkout branch2
git branch

# merge branch1 into branch2
git merge branch1

-------------------------------------------------------------------------------------------------------------
#REBASE THEN FIX CONFLICTS
===========================
CREATE USER_1_2 > USER1 ADD TEXT > STAGE ALL > UNSTAGE > 

$ git branch user1
$ git branch user2
$ git branch user3

$ git checkout user1

	$ vi tempfile.txt
				$ git add .

				$ git status -s
				A  "GIT_Practice/List of git task questions with answer hint.bash"
				A  HTML/HTML_with_CSS_basic.html
				A  HTML/IT_JOBS_HTML_BASIC.html
				A  tempfile.txt

				# to unstage particular file
				$ git reset tempfile.txt

				$ git status -s
				A  "GIT_Practice/List of git task questions with answer hint.bash"
				A  HTML/HTML_with_CSS_basic.html
				A  HTML/IT_JOBS_HTML_BASIC.html
				?? tempfile.txt

				# to unstage all files
				$ git reset

	$ git status -s
	$ git add tempfile.txt
	$ git commit -m "1st commit"

$ git checkout user2
	$ vi tempfile.txt

	$ git status -s
	$ git add tempfile.txt
	$ git commit -m "2nd commit"

$ git checkout main
	$ git merge user1

	$ git log -s

$ git checkout user2

	USER@Selva MINGW64 /d/lms/LMS.github.io (user2)
	$ git branch
	  main
	  user1
	* user2

	$ ls -s
	$ git rebase main
	Auto-merging tempfile.txt
	CONFLICT (add/add): Merge conflict in tempfile.txt
	error: could not apply 07d625d... 2nd commit
	hint: Resolve all conflicts manually, mark them as resolved with
	hint: "git add/rm <conflicted_files>", then run "git rebase --continue".
	hint: You can instead skip this commit: run "git rebase --skip".
	hint: To abort and get back to the state before "git rebase", run "git rebase --abort".
	Could not apply 07d625d... 2nd commit

	$ vi tempfile.txt

	$ git status -s
	AA tempfile.txt
	?? HTML/

	$ git add tempfile.txt
	$ git status -s
	$ git rebase --continue
	$ cat tempfile.txt

#---------------------------------------------------------------------------------------------------------
#STASH AND THEN REBASE
========================

$ git checkout user3
$ vi tempfile.txt
$ git add tempfile.txt

$ cat tempfile.txt
$ git status -s
 M tempfile.txt
?? HTML/

$ git log --oneline

$ git rebase main
error: cannot rebase: You have unstaged changes.
error: Please commit or stash them.

$ git reset tempfile.txt

USER@Selva MINGW64 /d/lms/LMS.github.io (user3)
$ git rebase main
error: cannot rebase: You have unstaged changes.
error: Please commit or stash them.

$ git stash
$ cat tempfile.txt

$ git stash list
stash@{0}: WIP on user3: 1161c46 1st commit

USER@Selva MINGW64 /d/lms/LMS.github.io (user3)
$ git stash apply
Auto-merging tempfile.txt
CONFLICT (content): Merge conflict in tempfile.txt

$ vi tempfile.txt

USER@Selva MINGW64 /d/lms/LMS.github.io (user3)
$ git status -s
UU tempfile.txt
?? HTML/

$ git add tempfile.txt
$ git commit -m "third scnrio"
$ git status -s

$ git checkout main
		Switched to branch 'main'

		$ git merge user3
		$ git push

---------------------------------------------------------
#other topic
# update the master branch with the latest changes from the remote repository
git pull origin main