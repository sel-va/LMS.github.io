git command to remove => rivert vs reset
	git revert command: new commit that undoes changes made in previous commit. it not delete commit from the repository
		git revert commit_id
		git revert 1s2s5d37 

	git reset command: Discards commits, it remove commits from local repository and also alter log.
		git reset commit_id
		git reset 1s2s5s3

git diff   : difference, last committed state, compare.
git status : current state, status of the files.

TAG is reference to specific commit. mark specific point in history, usually to mark release or an update.
	2 types: lightweight & annotated.
		Lightweight tags: git tag <tag-name> <commit-hash>
		Annotated tags: git tag -a <tag-name> -m <message> <commit-hash>


Cherry-pick
===========
	Uses git cherry-pick command to apply the specific commit from branchA to branchB. 
	Finally, it verifies the changes in branchB by running git log.

	#create new repository
	git init

	#create branchA
	git checkout -b branchA

	#make changes in branchA
	echo "text in file" >> file.txt
	git add file.txt
	git commit -m "Added text to file in branchA"

	#switch to branchB
	git checkout -b branchB

	#make different changes in branchB
	echo "text in branchB" >> file.txt
	git add file.txt
	git commit -m "Added text to file in branchB"

	#get commit hash of commit in branchA
	git log --oneline -n 1

	# use git blame to view the author of specific lines
	git blame file.txt

	#search for specific pattern in the repository's history
	git grep "text"

	#apply commit from branchA to branchB
	git cherry-pick <commit-hash>
			$ git cherry-pick 7e827ad
				The previous cherry-pick is now empty, possibly due to conflict resolution.
				If you wish to commit it anyway, use:

					git commit --allow-empty

				Otherwise, please use 'git cherry-pick --skip'
				On branch branchB
				You are currently cherry-picking commit 7e827ad.
				  (all conflicts fixed: run "git cherry-pick --continue")
				  (use "git cherry-pick --skip" to skip this patch)
				  (use "git cherry-pick --abort" to cancel the cherry-pick operation)

				nothing added to commit but untracked files present (use "git add" to track)

	USER@Selva MINGW64 /d/lms (branchB|CHERRY-PICKING)
	git commit --allow-empty
	[branchB df88ae5] Added text to file in branchB
	 Date: Tue Jan 17 22:56:28 2023 +0530

	#verify the changes in branchB
	git log --oneline
