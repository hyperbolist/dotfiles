# TODO: fix neovim's fish indentation
# heavily inspired by https://github.com/SylvanFranklin/.config/blob/main/scripts/tmux-session-dispensary.sh
function tmux-session -a cmd -d zoinks

    switch "$cmd"

        case open
            set roots \
                "$HOME/workspace/projects" \
                "$HOME/code/oss" \
                "$HOME/code" \
                "$HOME"

            if set -q argv[2]
                set path $argv[2]
            else
                set path (fd . $roots \
                    --type=dir \
                    --max-depth=1 \
                    --full-path \
                    --base-directory $HOME |
                  sed "s:^$HOME/::" |
                  fzf --input-border="line" --input-label="Open")
                if [ "" = "$path" ]
                    return
                end
                set path "$HOME/$path"
            end

            set name (basename $path | tr '.' '_')

            if ! tmux has-session -t $name 2>/dev/null
                tmux new-session -ds $name -c $path
            end

            tmux switch-client -t $name || tmux -2 new-session -A -s $name -c $path

        case select
            set current_session (tmux display-message -p '#S')
            set name (tmux list-sessions 2>/dev/null |
                sed -E 's/:.*$//' |
                grep -vE "^$current_session\$" |
                fzf --input-border="line" --input-label="Select")
            if [ "" = "$name" ]
                return
            end

            tmux switch-client -t $name

        case destroy
            set current_session (tmux display-message -p '#S')
            set name (tmux list-sessions 2>/dev/null |
                sed -E 's/:.*$//' |
                grep -vE "^$current_session\$" |
                fzf --input-border="line" --input-label="Destroy")
            if [ "" = "$name" ]
                return
            end

            tmux list-panes -t $name -F '#{pane_pid}' | xargs -I{} kill -TERM {}
            # NOTE: maybe we should just let the session naturally evaporate when all of its panes die?
            # NOTE: ...and if any panes are still sticking around, we can at least inspect why
            # tmux kill-session -t $name ^/dev/null
            # true

    end
end
