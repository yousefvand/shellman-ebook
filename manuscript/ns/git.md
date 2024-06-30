## git

Contains `git` commands. You may need to install `git` on your system. Git is a version control system for tracking changes of projects.

Install `git`:

- Debian-based linux systems
  - `sudo apt install git`
- Red Hat-based linux systems
  - `sudo yum install git`
- Archlinux
  - `sudo pacman -S git`
- Mac
  - `brew install git`
- Windows
  - Download from <https://gitforwindows.org/>

### git begin | git start

starts a git in the directory by running `git init` command and set `username` and `email` locally,globally or systemic. Repeating this command overwrite previous values.     


```bash
git config --global user.name "remisa yousefvand"
git config --global user.email remisa.yousefvand@gmail.com
```

### git branch create

Create a local branch and switch into it.

```bash
#!/usr/bin/env bash

git checkout -b develop
```

### git branch delete local

Delete local branch.

```bash
#!/usr/bin/env bash

git branch --delete localBranch
```

### git branch delete remote

Delete remote branch.

```bash
#!/usr/bin/env bash

git push origin --delete remoteBranch
```

### git branch list

List all branches.

```bash
#!/usr/bin/env bash

git branch
```

### git branch push

Push branch to remote.

```bash
#!/usr/bin/env bash

git push origin develop
```

### git branch rename

Rename current branch.

```bash
#!/usr/bin/env bash

git branch -m newName
```

### git changes revert

Revert tracked changes.

```bash
#!/usr/bin/env bash

git checkout .
```

### git clone branch https

```bash
#!/usr/bin/env bash

git clone -b develop git@github.com:remisa/shellman.git
```

### git clone branch

Clone a repository to local machine and switch to a specific branch.

```bash
#!/usr/bin/env bash

git clone -b develop https://github.com/user/repository.git
cd repository
```

### git clone https

```bash
git clone https://github.com/yousefvand/shellman.git
```

### git clone

Clone a repository to local machine.

```bash
#!/usr/bin/env bash

git clone git@github.com:yousefvand/shellman.git
cd repository
```

### git commit list notPushed

List non pushed commits.

```bash
#!/usr/bin/env bash

git log origin/master..HEAD
```

### git commit search

Search for a commit which contains searchCriteria.

```bash
#!/usr/bin/env bash

git log --all --grep='typo'
```

### git commit undo

Undo last N commits. **soft** preserve local changes. **hard** delete local changes.

```bash
#!/usr/bin/env bash

git reset --soft HEAD~1 # undo last local change but don't delete them
```

### git commit

```bash
git commit -m "fixes #12, #13, #15"
# or
git commit -m "fixed typo"
```

### git config list

List a brief configuration of local git configuration..

```bash
#!/usr/bin/env bash

git config --list
```

### git patch apply

Apply a patch from file.

```bash
#!/usr/bin/env bash

git apply < patch1.patch
``` 

### git patch create

Create a patch from changes.

```bash
#!/usr/bin/env bash

git diff > patch1.patch
```

### git remote list

List all remotes.

```bash
#!/usr/bin/env bash

git remote
```

### git remote urlAdd https | git remote url add https

Add remote url using HTTPS.

```bash
git remote add origin https://github.com/yousefvand/shellman.git
```

### git remote urlAdd | git remote url add | git remote urlAdd ssh | git remote url add ssh

Add remote url using SSH.

```bash
git remote set-url origin git@github.com:yousefvand/shellman.git
```

### git remote urlChange https | git remote url change https

Change remote url using HTTPS.

```bash
git remote set-url origin git@github.com:yousefvand/shellman.git
```

### git remote urlChange | git remote url change | git remote urlChange ssh | git remote url change ssh

Change remote url using SSH.

```bash
git remote set-url origin git@github.com:yousefvand/shellman.git
```

### git tag commit

Tag a commit.

```bash
#!/usr/bin/env bash

git tag -a release/1.0.0 -m "1.0.0 release"
```

### git tag list

List all tags.

```bash
#!/usr/bin/env bash

git tag
```

### git tag remote delete

Delete tag from remote.

```bash
#!/usr/bin/env bash

git push --delete origin tagName && git push origin :tagName
```

### git tag remote push

Push tag to remote.

```bash
#!/usr/bin/env bash

git push origin tagName
```
