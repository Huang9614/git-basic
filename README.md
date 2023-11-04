# Trials by learning git
- first connect the local git with the github repo`
- after git push -u origin main command, try just use git push.
- YES! It works, no need to add "-u origin main" again
- delete the github branch, but keep the local branch, checkout what will happen after git push!
- there is no need to create GitHub branch online, because "git push -u origin test-branch" will create the GitHub branch with the same name as local branch if there's no such GitHub branch 
- Try different local branch name in pair of Github branch name
- after "git push -u origin test-branch" and switched to local branch :test-branch2, if try git push ,it will raise error, saying "fatal: The current branch test-branch2 has no upstream branch. "

# reference
- check the [introduction example](https://docs.github.com/en/get-started/quickstart/hello-world) to go roughly through how github works in terms of website UI
- check the [official documents](https://docs.github.com/en/get-started/using-git/about-git#example-contribute-to-an-existing-repository)

# Basic command
## initialize: identify the user and user-email
1. `cd ~`
2. `git config --global user.name "<your-name>"`
3. `git config --global user.email "<your-email>"`
- After the above commands, you should find the hidden file ".gitconfig" by recalling the command `ll` in the home folder

## add the ssh key to GitHuh account
## create local git repo. and connect to simutanuouslly built GitHub repo.
- create [GitHub repo.](https://docs.github.com/en/get-started/quickstart/create-a-repo?tool=webui)
- create a local repo.
  1. `git init <git-repo-name>`
  2. `cd <git-repo-name>`
  3. `vim README.md`
  4. write some stuff in the .md file and use `:wq` to save the changes and then quit
  5. `git add README.md`
  6. `git commit -m "inital"`
     - `git log` can be used to check the history of commits
     - or check the history to the certain file on GitHub
  8. `git branch -m main`
- connect the GitHub repo. and the local git repo
  1. `git remote add origin <ssh of the just now created GitHub repo.>`
  2. `git push -u origin main`

## commit the changes on local git repo to the corresponding GitHub repo
- the following commands are based under the assumption of successful connection between git repo and GitHub repo
1. `git add <changed-file-name>`
2. `git commit -m "description of changes"`
3. `git push`

## create locally the branch of a repo.
1. `git branch <branch-name>`
2. `git checkout <branch-name>` : switch to the branch
3. `git add <changed-file-name>`
4. `git commit -m "description"`
5. `git push -u origin <local-branch-name>`
- after the 5th. command, all `git push` will commit to the GitHub branch
- the name of git branch is the same as GitHub branch

## clone the existed GitHub repo to local
1. `git clone <ssh-to-the GitHub-repo>`
2. `git checkout <branch-name>`
3. `git add <changed_file>`
4. `git commit -m "Description"`
5. `git push`
- due to the `git clone`, there is no need for the connection: `-u origin main`

## merge the branches to the main 
1. `git fetch`
2. `git checkout <name of base branch, normally the main>`
3. `git merge <name of the to be merged branches>`
4. `git push`

## fetch the commited file
1. `git checkout <branch>`
2. `git fetch`

