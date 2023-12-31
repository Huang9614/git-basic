# 参考资料
- check the [introduction example](https://docs.github.com/en/get-started/quickstart/hello-world) to go roughly through how github works in terms of website UI
- check the [official documents](https://docs.github.com/en/get-started/using-git/about-git#example-contribute-to-an-existing-repository)
- [查看](https://git.scc.kit.edu/AIL/ail/-/wikis/Infrastructure/Software/Git/Git-AIL-Development-Workflow)

# 不同情况
1. [毫无基础。刚申请完github账号，啥也不懂](#情况一)
2. 有感兴趣的repo.，不知道怎么弄到本地运行
3. 弄到本地，小修小改，如何更新repo.
4. 想把已有的github repo.和本地的repo.（文件夹）相连接
5. fork了别人的repo.，别人和咱们都更新了，如何合并两边的修改
6. [fork了别人的repo.，修改后，如何申请合并](#情况六)

<a name="情况一"></a>
# 情况一
## initialize: identify the user and user-email
1. `cd ~`
2. `git config --global user.name "<your-name>"`
3. `git config --global user.email "<your-email>"`
- After the above commands, you should find the hidden file ".gitconfig" by recalling the command `ll` in the home folder

## add the ssh key to GitHub account
1. `cd && ll` 返回home文件夹，查看是否存在.ssh文件夹，如果没有，则需要自行创建ssh key
2. `ssh-keygen -t rsa -b 2048` 指定生成RSA密匙类型的密匙；指定密匙的比特长度，2048已经足够，还可以是4096；生成私匙(id_rsa)和公匙(id_rsa.pub)文件
3. `cd .ssh && cat id_rsa.pub` 打开.ssh文件夹，查看id_rsa.pub文件内容
4. 复制.pub文件内容，添加到GitHub账户中

## Create a local git repo. and connect to simultaneously built GitHub repo.
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
- connect the GitHub repo. and the local git repo; 
  1. `git remote add origin <ssh of the just now created GitHub repo.>`
  2. `git push -u origin main` 将本地的 `main` 分支的提交推送到名为 `origin` 的远程仓库，并设置本地 `main` 分支跟踪（track）远程仓库的 `main` 分支

  `git remote add` 添加一个远程仓库。但是，请注意，这只是告诉 Git 你的本地仓库有一个远程仓库，而不涉及与本地分支的远程分支之间的跟踪关系。check [ChatGPT history](https://chat.openai.com/share/eae04fb6-8c31-4458-ad06-551ac8c03b56)
## Commit the changes on the local git repo to the corresponding GitHub repo
- the following commands are based on the assumption of a successful connection between git repo and the GitHub repo
1. `git add <changed-file-name>`
2. `git commit -m "description of changes"`
3. `git push`

## Create locally the branch of a repo.
1. `git branch <branch-name>`
2. `git checkout <branch-name>` : switch to the branch
3. `git add <changed-file-name>`
4. `git commit -m "description"`
5. `git push -u origin <local-branch-name>`
- after the 5th. command, all `git push` will commit to the GitHub branch
- the name of git branch is the same as GitHub branch

## Clone the existing GitHub repo to local
1. `git clone <ssh-to-the GitHub-repo>`
2. `git checkout <branch-name>`
3. `git add <changed_file>`
4. `git commit -m "Description"`
5. `git push`
- due to the `git clone`, there is no need for the connection: `-u origin main`

## Merge the branches to the main 
1. `git fetch`
2. `git checkout <name of the base branch, normally the main>`
3. `git merge <name of the to be merged branches>`
4. `git push`

## fetch the committed file
1. `git checkout <branch>`
2. `git fetch`

## Git fork
- 完整复制别人的repo.
- 可以自行管理和修改
- 可以通过 `git pull`和 `git request` 请求合并，共同协作
- 可以作为repo.的备份

## initialize the local git and connect to a irrelative GitHub repo.
1. `git init`
2. `git status`
   - 在较新版本的 Git 中，只需执行 git init，然后 Git 会自动创建 main 分支。
   - 在较老版本的 Git 中，你可能需要先执行 git init，然后执行 git checkout -b main 来创建并切换到 main 分支。
3. `git checkout -b main`
4. `git remote add origin <GitHub-repo.SSH>`
   - 在你的本地 Git 仓库中，通过使用 git remote add origin <远程仓库URL> 可以添加一个远程仓库。但是，请注意，这只是告诉 Git 你的本地仓库有一个远程仓库，而不涉及与本地分支的远程分支之间的跟踪关系。
   - `git fetch origin` 拉取远程分支到本地
   - `git branch -u origin/main main` 将本地分支与远程分支关联
   - `git pull origin main --allow-unrelated-histories` 如果你希望忽略不相关历史的错误，你还可以使用 --allow-unrelated-histories 选项进行合并
5. `git pull` 从 GitHub 上的远程仓库克隆了一个新的仓库，并且该仓库包含了一些分支; 当前的本地分支没有与远程分支建立跟踪关系
6. `git branch -u origin/main main` Git知道了本地分支 main 应该跟踪远程分支 origin/main

## 如何通过git bash删除repo上的某些文件和文件夹；如何添加新的文件夹
[查看](https://chat.openai.com/share/ed4bcacd-ba23-4749-9e7e-c487298a7287)


<a name="情况六"></a>
# 情况六
### Notes
- `git branch -m <new name>` 用于重命名分支; `git branch -u <远程名>/<远程分支名> <本地分支名>` 将本地分支 `<本地分支名>` 设置为跟踪远程分支 `<远程名>/<远程分支名>`。例如，如果你想将本地的 `main` 分支跟踪远程的 `origin/main` 分支，可以执行 `git branch -u origin/main main`; `git checkout -b main` 创建一个名为 main 的新分支，并切换到这个分支;

# git 冲突解决
1. 本地没有建立ssh
2. [本地分支落后于远程仓库的主分支 (main)](https://chat.openai.com/share/7ba82828-72a9-486d-b80e-690bdcd0ea15)
3. [合并两个不相关的git仓库](https://chat.openai.com/share/82a06790-4d4a-4893-81f0-ec233de24a28)
