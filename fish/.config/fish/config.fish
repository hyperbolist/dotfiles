# homebrew
eval (/opt/homebrew/bin/brew shellenv)

# sensible aliases
source $HOME/.fish_aliases

# variable-based configuration
source $HOME/.fish_variables

# prompt
starship init fish | source

# gpg-agent wish ssh support
if [ -z (pgrep gpg-agent) ]
    gpg-agent --daemon --enable-ssh-support >/dev/null
end
set -x GPG_TTY (tty)
set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

## this is slow, don't actually do this all the time
pyenv init - | source

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/esherman/.lmstudio/bin
# End of LM Studio CLI section
