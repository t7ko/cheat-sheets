Tags: :git:github:

* Publish to github (will also create new branch there):
  - `git push origin dev`
  - `git push upstream utags:tags`
* Create local working brach as copy of remote branch:
  - `git co -b dev origin/dev`
* Add 'remote' repo to track it:
  - `git remote add upstream https://.../vimwiki/vimwiki.git`
* git diff
  - `git diff --minimal --ignore-all-space`
  - `git diff --cached`
* git log / lol
  - `git log --graph --decorate --pretty=oneline --abbrev-commit`
* change remote of a checked out branch
  - `git branch branch_name --set-upstream-to your_new_remote/branch_name`
* store .git files elsewhere:
  - `git --git-dir=/var/repo/one.git --work-tree=/var/work/one init`

```
# Check out remote branch without creating a local 'remote'
# https://stackoverflow.com/questions/10200307/how-to-git-fetch-and-checkout-without-creating-a-remote-branch-locally
# to merge:
git fetch git://github.com/xxx/xxx.git branch_name && git merge FETCH_HEAD

# to create a branch
git fetch git://host.com/path/to/repo.git remote-branch-name:local-branch-name
git checkout local-branch-name


# DCO/signed commit
git verify-commit # to check signature
git rebase --signoff HEAD~2 # sign last 2 commits

[alias]
  # Usage: git signoff-rebase [base-commit]
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
