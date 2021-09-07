# homebrew is in a different location on apple silicon
/opt/homebrew/bin/brew shellenv | source

# rbenv setup needs to be sourced after brew setup
source ~/.config/fish/rbenv.fish

# if there's no node on the path and there's an .nvmrc, run nvm
if [ ! (which node) ] && [ -n .nvmrc ]
    nvm
end

# sensible aliases
source ~/.fish_aliases

# variable-based configuration
source ~/.fish_variables

# prompt
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

