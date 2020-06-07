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
