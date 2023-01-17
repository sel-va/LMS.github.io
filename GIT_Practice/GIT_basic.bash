source code manager or version controlling system

1. centralized version controlling system 
   work based => client server architecture =>  master slave => hub spoke model
   instant sink
2. Distributed version control (GIT)

LINUX CMDS
=============
mkdir folder_name -- create folder
cd folder_name    -- get in folder name
pwd --Present working directory name
ls -lrt  -- list all files
ls -lrta  --show hidden files
vi filename --create file name
:wq!  --save and exit from that file
clear  -- clear screen
cd..  -- came out from current directory
history --show all history commands used
rm -Rf file_name => remove file (delete)
rmdir folder_name => remove empty folder
cat file_name => view current file content

GIT CLI Command -- start with git word
========================================
git --version
yum install git -y

git init => intiate git / create local repositry in current folder
cd .git/ => local repositry
ls -lrt  => list all files (shows all file inside git folder)
git config --global user.name "selva"                   => globally declare username
git config --global user.name "er.ks.selva@gmail.com"   => email declare
git status -s   => Compare current folder file and local repositry
git status => full detail
git add file_name => added to staging area
git commit => to commit in local repositry
git commit -m "commit message"  => to commit in local repositry with message
git log => give full details about commit
git branch => see what branch in your system
git log --oneline => show commit_id and message in oneline
git show commit_id => show full message about that commit
git push => save file in central repositry
git remote add project_name/url_varaible_declaration git_url
git remote => show all saved variable name
git push variable_name master => push to repositry from master brach

git branch branch_name  => to create new branch
git branch -d branch_name  => to remove new branch
git branch --delete branch_name  => to remove new branch
git checkout new_branch_name  => to move to new_branch
git merge new_branch_name  ==> smooth merge
git add -a
git add -am  ==> for direct commit with local repositry wo staging(if we have trace file)
git add .  ==> To add all file in local repositry

config needed for merge file b/w diff branch
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false

git mergetool => to compare and view
	ctrl shift w or ctrl caps w (press two times) => move inside merge tool to edit
	10 times esc button => reset model
	:diffg RE or BA or LO  (select file by using first two letter from REMOTE/BASE/LOCAL )
	:wqa  => two quit all window

git rebase master => cmd to change base file
git chery-pick commit_id  ==> to move 

git mv OLD-FILENAME NEW-FILENAME

git status -s

vi filename --add some extra contents
:wq!
git status -s
git add file_name
git status -s  => no status means all file same in local repositry
git commit -m " second commit message"

git push  -> push files to remote-repositry
git pull -> pull up-to-date files from remote-repositry
git fetch 

git fetch: not merge them with local repository. Instead, it downloads as separate branch - review the changes before merging them with local code.
git pull: automatically merges them with local repository. quickly update local repo with latest changes from remote repo.
--------------------------------------------------------------------------------------
untracked file -> new file not in staging
modified file -> tracked file already in staging

merge conflict

git merge tool => vim diff

ls -lrt => list all files (we have backup file)

RE-BASE (change base file - do only from feature branch)
