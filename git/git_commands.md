git config --global user.name "username"
git config --global user.email "username@gmail.com"
use above commands to set user-name and email for the git, these are for idententifing the changes commited on github

To edit your user name or email later, use:
git config --global --edit
This command opens the global Git configuration file in your default text editor.

To clone a repository into the current folder, use:
git clone "repo-url" 
	For example, replace <repository-url> with an actual URL like https://github.com/mrhk-dev/Coding.git.
	
To view the current repository status, run:
git status

To add a new file to Git, use:
git add <file_name>
	For example, to add a file named intro_to_git, you would run:
		git add intro_to_git

To commit the changes to your local Git repository, use:
git commit -m "write the comment here"
Ensure your commit messages are descriptive.

To push the committed changes to the main branch of the repository, use:
git push origin branchname
If you want to push to a different branch, specify the branch name after origin.

For modified changes, remember to stage the file changes using:
git add <file_name>
Then commit the changes.

To add all the modified files to the git, use:
git add .
Alternative commands:
git add --add 
git add -A

To add files/folders to be ignored for commit, first create a file .gitignore
and add the folders as foldername/
for file add filename
	ex: testing_gitignore/
		text.txt

To check the current branch:
git branch
This display the current selected branch with *
	ex: *main
	     develop
		
To create a branch:
git branch branchname
	
To change the branch:
git checkout branchname

To merge branches, first checkout into main/master
git merge branchname
then push to the main/master

To set the access token for pushing code to GitHub, use:
git remote https://your_access_token@github.com/username/repository-name.git
This is necessary for authenticating when pushing to private repositories or using HTTPS.

to view the current git remotes for fetch and push:
git remote -v

To check the logs:
git log

To update the branch with the origin:
1: fetch the changes with "git fetch origin"
2: merge changes with "git merge origin/<brnach_name>"
Note to fetch and merge in single command:
git pull origin <branch_name>


