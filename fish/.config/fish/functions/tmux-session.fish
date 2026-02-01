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
                  fzf)
                if [ "" = "$path" ]
                    return
                end
                set path "$HOME/$path"
            end

            set name (basename $path)

            if ! tmux has-session -t $name 2>/dev/null
                tmux new-session -ds $name -c $path
            end

            tmux switch-client -t $name || tmux -2 new-session -A -s $name -c $path

        case select
            set current_session (tmux display-message -p '#S')
            set name (tmux list-sessions 2>/dev/null |
                sed -E 's/:.*$//' |
                grep -vE "^$current_session\$" |
                fzf)
            if [ "" = "$name" ]
                return
            end

            tmux switch-client -t $name

        case destroy
            set current_session (tmux display-message -p '#S')
            set name (tmux list-sessions 2>/dev/null |
                sed -E 's/:.*$//' |
                grep -vE "^$current_session\$" |
                fzf)
            if [ "" = "$name" ]
                return
            end

            tmux kill-session -t $name

    end
end
