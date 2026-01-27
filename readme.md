# dotfiles

Managed by [gnu stow](https://www.gnu.org/software/stow/).

## Quickstart

```bash
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install fish shell
brew install fish

fish

# install stow
brew install stow

# clone this repo
git clone git@github.com:randori-esherman/dotfiles.git

cd dotfiles

# install all of the dotfiles
rm -rf ~/.config/fish; find $PWD -type d -depth 1 -not -name ".*" | xargs basename | xargs stow -vv

# install all things
brew bundle

# tmux install the plugins
tm
# inside tmux: C-a I
```
