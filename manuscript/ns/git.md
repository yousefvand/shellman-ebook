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

### git clone

Clone a repository to local machine.

```bash
#!/usr/bin/env bash

git clone https://github.com/user/repository.git
cd repository
```

### git clone branch

Clone a repository to local machine and switch to a specific branch.

```bash
#!/usr/bin/env bash

git clone -b develop https://github.com/user/repository.git
cd repository
```

### git config list

List git configurations.

```bash
#!/usr/bin/env bash

git config --list
```

### git config set

Set a *git* configuration.

```bash
#!/usr/bin/env bash

git config --global user.name "Remisa"
```

### git commit

Commit changes.

```bash
#!/usr/bin/env bash

git commit -m "fixed typo"
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

### git commit list notPushed

List non pushed commits.

```bash
#!/usr/bin/env bash

git log origin/master..HEAD
```

### git branch create

Create a local branch and switch into it.

```bash
#!/usr/bin/env bash

git checkout -b develop
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

### git changes revert

Revert tracked changes.

```bash
#!/usr/bin/env bash

git checkout .
```

### git patch create

Create a patch from changes.

```bash
#!/usr/bin/env bash

git diff > patch1.patch
```

### git patch apply

Apply a patch from file.

```bash
#!/usr/bin/env bash

git apply < patch1.patch
```

### git remote list

List all remotes.

```bash
#!/usr/bin/env bash

git remote
```

### git remote urlAdd

Add remote url.

```bash
#!/usr/bin/env bash

git remote add origin https://github.com/user/repository.git
```

### git remote urlChange

Change remote url.

```bash
#!/usr/bin/env bash

git remote set-url origin https://github.com/user/repository.git
```

### git tag list

List all tags.

```bash
#!/usr/bin/env bash

git tag
```

### git tag commit

Tag a commit.

```bash
#!/usr/bin/env bash

git tag -a release/1.0.0 -m "1.0.0 release"
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
