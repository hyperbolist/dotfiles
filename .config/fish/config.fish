# if there's no node on the path and there's an .nvmrc, run nvm
if [ ! (which node) ] && [ -n .nvmrc ]
    nvm
end

# add python to path (yuck)
# we do this almost exclusively for ranger
set PATH /Library/Frameworks/Python.framework/Versions/3.7/bin $PATH

# for kubectl krew
set PATH $HOME/.krew/bin $PATH

# add go to the path
set PATH $HOME/go/bin $PATH

# sensible aliases
source ~/.fish_aliases

# variable-based configuration
source ~/.fish_variables

# prompt
starship init fish | source
