# ~/.dotfiles

adapted from [Nicola Paolucci](https://www.atlassian.com/git/tutorials/dotfiles)'s scheme

## new machine

```bash
git clone --bare https://github.com/hyperbolist/dotfiles.git $HOME/.dotgit
function dotgit {
   /usr/bin/git --git-dir=$HOME/.dotgit/ --work-tree=$HOME $@
}
mkdir -p .dotgit-backup
dotgit checkout
if [ $? = 0 ]; then
  echo "Checked out dotgit.";
  else
    echo "Backing up pre-existing dot files.";
    dotgit checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotgit-backup/{}
fi;
dotgit checkout
dotgit config status.showUntrackedFiles no
```
