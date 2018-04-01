---
title: Install GitLab on local network server (Centos 6.5)
date: 2018-04-01 15:29:13
tags:
  - GitLab
catogories:
  - git
---

## Introduction

We are using GitLab on the cluster of our group, for the purposes below:

- Collaborate on projects.
- Controling version of code or documents.
- Distributed-backup files, everyone could have a local copy with permission.
- Network problem for internet access would not affect us.

<!--more-->

## Version control

Here we discuss a simple situation of version control.
Suppose we have a project "project-1", hosting by group "group-1".

- At first the project is defaultly set as branch "master", which implement some key features.
- Then some bugs are found during testing, and reporters report them on "issues".
- Some developers try to fix the bugs, while the "master" code is still needed by other people.
At this time, a branch "fix" is used. After the bugs are fixed, the "fix" branch can be merged
into "master".
- Meanwhile, developers are trying to implement more features, a branch "develop" is made.
As this is done, the developer can ask master to merge the "develop" branch into "master".
- Someone made a mistake and the code has been committed. Don't panic, we can revert the version.

<https://git-scm.com/book/en> is a good website for learning git and version control.

## Git for users

The website for GitLab is <http://10.105.27.100:2020/>

1. Register and then sign in.

2. As a team leader, create a group, create a project, then add members, set permissions
via "Settings".

![](/images/project-settings.png)

3. As a collaborator, commit changes, work on branches and ask a merge request if needed.

Here is an example, first download the project to local computer, perhaps user name and password will be asked.
```
git clone http://10.105.27.100:2020/<group>/<project>.git 
```
Go to the downloaded folder, initialize the git project
```
git init
```
Configure the user name and email,
```
git config --global user.name 'John Smith'
git config --global user.email 'JohnSmith@example.com'
```
Add the remote server address
```
git remote add origin http://@10.105.27.100:2020/<group>/<project>.git
```
> SSH key may be added into authorized keys if you don't want to input user name and password every time.

Add your modifications to the project and commit.

If you need to commit it on "master":
```
cat "This is a test" > new_file
git add new_file
git commit -m "add new_file"
git push origin master
```
If you need to make a new branch, say "fix":
```
git pull master
git branch fix master
git checkout fix
cat "This is a test" > new_file
git add new_file
git commit -m "add new file"
git push origin fix
```
On the website, ask for a "new merge request" if the branch should be merged.

> For collaborators, it is very important to do `git pull` first, otherwise, modifications may be done on a older version.

## Git for administrators

Logon as root, then run
```
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | bash
EXTERNAL_URL="http://10.105.27.100:2020" yum -y install gitlab-ee
```

Refer to <https://about.gitlab.com/installation/#centos-6> for the detailed instructions for installation and setup.

## Tips

- Copy the `CentOS-Base.repo` in <https://lug.ustc.edu.cn/wiki/mirrors/help/centos> to `/etc/yum.repos.d/`.
```
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
```

- If `yum` doesn't work after updating, then edit the file `/usr/bin/yum`, modify the `#!/usr/bin/python` to `#!/usr/bin/python2.6`.

- Add ports for the website: edit `/etc/gitlab/gitlab.rb`, 
```
extern_url = "http://example.com:8888"
```
