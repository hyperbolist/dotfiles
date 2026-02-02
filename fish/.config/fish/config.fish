# homebrew
eval (/opt/homebrew/bin/brew shellenv)

# sensible aliases
source $HOME/.fish_aliases

# variable-based configuration
source $HOME/.fish_variables

# prompt
starship init fish | source

# # gpg-agent wish ssh support
# if [ -z (pgrep gpg-agent) ]
#     gpg-agent --daemon --enable-ssh-support >/dev/null
# end
# set -x GPG_TTY (tty)
# set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
# gpgconf --launch gpg-agent

# # this is slow, don't actually do this all the time
# pyenv init - | source

# vi mode
fish_vi_key_bindings
set fish_cursor_insert block
set fish_cursor_command block
set fish_cursor_visual block

# ASDF configuration code
if test -z "$ASDF_DATA_DIR"
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# krew
set -q KREW_ROOT; and set -gx PATH $PATH $KREW_ROOT/.krew/bin; or set -gx PATH $PATH $HOME/.krew/bin
