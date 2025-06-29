
# designed to be sourced in bash shell / scripts

declare -A WIKI_LIST
  # This is a mapping of wiki 'name/label' to a path it's located at.
  # Populate this after you source this file.
  # For example:
  # WIKI_LIST[personal]="/absolute/folder/path/one"
  # WIKI_LIST[work]="/absolute/folder/path/two"

WIKI_SCRIPTS_DIR=$(dirname "$(realpath "$BASH_SOURCE")")

wiki_git() {
  if [ -f .git.sh ]; then
    sh .git.sh "$@"
  else
    git "$@"
  fi
}

wiki_sync() {
  if test -z "$(ps ax | grep ssh-agent)"; then
    if ! t7_confirm "ssh-agent does not seem to be running. Continue?"; then
      echo "hint:"
      echo "\$ eval \$(ssh-agent)"
      echo "\$ ssh-add"
      false
      return
    fi
  fi
  wiki_do wiki_sync_one
}

wiki_do() {
  echo "Doing '$*' on wikis:"
  for wiki_name in "${!WIKI_LIST[@]}"; do
    ( echo "* $wiki_name"
      cd "${WIKI_LIST[$wiki_name]}"
      "$@"
    )
  done
}

wiki_generate_reference() {
  title="Auto-generated pages index:"
  sed -i "/^$title/"',$d' home.md
  echo -ne "$title\n\n" >> home.md
  find . -name '*.md' | sort | "$WIKI_SCRIPTS_DIR/home.py" >>home.md
}

wiki_update_reference_and_commit() {
  wiki_generate_reference
  cnt=`wiki_git status --porcelain --untracked-files=all | wc -l`
  if test "$cnt" -gt 0; then
    # have unsaved changes
    wiki_git status
    echo
    echo "Will be doing this:"
    wiki_git add -A --dry-run
    if ! t7_confirm "Continue and save these?"; then
      false
      return
    fi
    wiki_git add -A
    wiki_git add .
    wiki_git commit -m "Updated"
  fi
}

wiki_sync_one() {
  wiki_update_reference_and_commit || exit
  echo
  echo 'Pull/rebase:'
  if ! wiki_git pull --rebase; then
    echo "Rebase failed, fix conflicts then retry"
    return
  fi
  wiki_update_reference_and_commit || exit
  echo
  echo 'Push:'
  if test -z "`wiki_git cherry`"; then
    echo 'Nothing to push'
  else
    wiki_git push
  fi
  wiki_git status
}

