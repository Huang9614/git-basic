#!/bin/bash

#############################################################
# This file teaches                                         #
# 1. how to connect and push to the remote BLANCK github    #
# 2. how to create different local branches                 #
# 3. push the local repo. to different remote branches      #
#############################################################

# ----- First need to create a GitHub repo and copy the SSH link -----


# -------- connect to the remote ----------------

git init
# can't skip the following two steps, otherwise you can't create a local branch 
git add <files_or_folders_with_changes> # git rm files to delete the files in the local repo, not only in the folder, use git ls-files to check
git commit -m "content of changing" # neccessary to tell the remote repo. what we have done locally, so that github will change itself automatically

# after commit, you are now in the local branch "master", git branch to ensure
git branch -M main  # forcely rename the current branch "master" as "main"
git remote add origin <GitHub_repo_SSH> # origin is the alias to the remote repo
git push -u origin main # push the changed (git add && git commit) local information to the main branch of the remote repo(origin)

# ---------- create local new branch ----------------

git branch -a # check all branches
git branch try # create new branch
git checkout try # switch to the new branch 
git branch -m try2 # change the current branch name to try2 
git checkout -b try3 # create a new branch try3 and switch to it

git push -u origin try3 
# create try3 branch in remote repo, 
# and connect the local try3 branch to the remote try3 branch; 
# push the local to there

# ----------- delete the branch ------------------
git checkout main # switch to the other branch
git branch -d try # delete the local branch
git branch -D try # forcely delete the local branch, ignore the unmerged content

git push origin --delete try # delete the remote branch
