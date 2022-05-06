Tags: :git:github:

# Publish to github (will also create new branch there):
  - `git push origin dev`
  - `git push upstream utags:tags`

# Create local working brach as copy of remote branch:
  - `git co -b dev origin/dev`

# Add 'remote' repo to track it:
  - `git remote add upstream https://.../vimwiki/vimwiki.git`

# git diff
  - `git diff --minimal --ignore-all-space`
  - `git diff --cached`

# git log / lol
  - `git log --graph --decorate --pretty=oneline --abbrev-commit`

# change remote of a checked out branch
  - `git branch branch_name --set-upstream-to your_new_remote/branch_name`

# store .git files elsewhere:
  - `git --git-dir=/var/repo/one.git --work-tree=/var/work/one init`
  - then:
  - `git --git-dir=/var/repo/one.git ...your-command`

# modify remote URL:
   - `git remote set-url origin git@github.com:t7ko/jdotxt.git`

# reset branch to point to a different commit:
   - `git reset --hard 0d1d7fc32`

# Local setting, per checked-out repository:
   - `git config user.name "Ivan Tishchenko"`
   - Stored in `.git/config`

# Undo last commit:
   - `git reset --soft HEAD~1` -- keeps in index
   - `git reset --mixed HEAD~1` -- removes from index as well, but keeps in
     working copy

# Unstage files:
   - `git reset`
   - `git reset -- README`

# Check out remote branch without creating a local 'remote'

   - https://stackoverflow.com/questions/10200307/how-to-git-fetch-and-checkout-without-creating-a-remote-branch-locally
   - to merge:
      - `git fetch git://github.com/xxx/xxx.git branch_name && git merge FETCH_HEAD`
   - to create a branch:

     ```bash
     git fetch git://host.com/path/to/repo.git remote-branch-name:local-branch-name
     git checkout local-branch-name
     ```

# DCO/signed commit

```bash
git verify-commit # to check signature
git rebase --signoff HEAD~2 # sign last 2 commits

[alias]
  ## Usage: git signoff-rebase [base-commit]
  signoff-rebase = "!GIT_SEQUENCE_EDITOR='sed -i -re s/^pick/e/' sh -c 'git rebase -i $1 && while git rebase --continue; do git commit --amend --signoff --no-edit; done' -"
```


# git pull all

http://stackoverflow.com/questions/4318161/can-git-pull-all-update-all-my-local-branches

plugin 'git-up'


# Deleting Branches

```
git push origin --delete b1

git remote prune origin # purge
git push origin --delete `git br -a | grep '^  remotes/origin' | sed 's|^  remotes/origin/||' | grep -v '^HEAD' |  grep -v '^main$' | head -n 20`
```


# re re re (rerere)

https://git-scm.com/book/en/v2/Git-Tools-Rerere

`git config rerere.enabled true`


# Moving Files from one Git Repo to Another, Preserving History

FYI -

Here is the guide that I followed to move files while maintaining history:
http://gbayer.com/development/moving-files-from-one-git-repository-to-another-preserving-history/

The only change was that I had to add --allow-unrelated-histories to the pull command (new git behavior).


# Rewriting history

* https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History
* https://git-scm.com/docs/git-filter-branch
* https://github.com/newren/git-filter-repo/
   * https://htmlpreview.github.io/?https://github.com/newren/git-filter-repo/blob/docs/html/git-filter-repo.html
   * see --replace-text, there is an example


# Removing sensitive data from your repository

https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository

git filter-repo 
git filter-repo --invert-paths --path PATH-TO-YOUR-FILE-WITH-SENSITIVE-DATA

https://github.com/newren/git-filter-repo

https://rtyley.github.io/bfg-repo-cleaner/

bfg --delete-files YOUR-FILE-WITH-SENSITIVE-DATA
bfg --replace-text passwords.txt


# rebase

First let's assume your topic is based on branch next. For example, a feature
developed in topic depends on some functionality which is found in next.

        o---o---o---o---o  master
             \
              o---o---o---o---o  next
                               \
                                o---o---o  topic

We want to make topic forked from branch master; for example, because the
functionality on which topic depends was merged into the more stable master
branch. We want our tree to look like this:

        o---o---o---o---o  master
            |            \
            |             o'--o'--o'  topic
             \
              o---o---o---o---o  next

We can get this using the following command:

    git rebase --onto master next topic

