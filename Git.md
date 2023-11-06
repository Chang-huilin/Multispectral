# 操作

## 获取所有分支

    PS C:\github\MyMasterLearning> git branch

    * main

## 新建分支 Multispectral

    PS C:\github\MyMasterLearning> git checkout -b Multispectral

    Switched to a new branch 'learning'

## 新分支

    PS C:\github\MyMasterLearning> git branch
    *learning
    main

## 切换分支

    git checkout main
    //或者
    git switch main

## 向分支添加改动及改动说明learing

    PS C:\github\MyMasterLearning> git add .
    PS C:\github\MyMasterLearning> git commit -m'Multispectral'
    [learning 7322069] learing
    1 file changed, 2 insertions(+), 2 deletions(-)

## 上传改动

    PS C:\github\MyMasterLearning> git push -u origin learning
    Enumerating objects: 11, done.
    Counting objects: 100% (11/11), done.
    Delta compression using up to 20 threads
    Compressing objects: 100% (9/9), done.
    Writing objects: 100% (9/9), 1.10 KiB | 1.10 MiB/s, done.
    Total 9 (delta 3), reused 0 (delta 0), pack-reused 0
    remote: Resolving deltas: 100% (3/3), completed with 1 local object.
    remote: 
    remote: Create a pull request for 'learning' on GitHub by visiting:
    remote:      https://github.com/Chang-huilin/MyMasterLearning/pull/new/learning
    remote:
    To github.com:Chang-huilin/MyMasterLearning.git
    * [new branch]      learning -> learning
    branch 'learning' set up to track 'origin/learning'.

## 关联到远程库

注意:

* 每次push前要先进行git add 文件名 和  git commit -m "注释"。

* 在第一次进行push时,我们加上-u参数,后期push时就不用再加-u参数。

* 如果新建的远程库有文件(比如远程仓库里的LICENSE或者READ.ME文件),需要先 git pull ,但是会遇到
        See git-pull(1) for details.

        git pull <remote> <branch>
        
        If you wish to set tracking information for this branch you can do so with:
        
        git branch --set-upstream-to=origin/<branch> master

    解决方法：在git pull origin master后面跟上参数--allow-unrelated-histories

        git pull origin master --allow-unrelated-histories

远程仓库有更新的话需要先pull下来、然后再push
