# TODO: fix neovim's fish indentation
function cdl -a cmd -d 'Tool to build, change, and version infrastructure'

    # cuddlefish-managed or cuddlefish-concerned environment variables
    set cuddlefish_env_names \
        AWS_ACCESS_KEY_ID \
        AWS_ASSUME_ROLE_TTL \
        AWS_AVAILABILITY_ZONES \
        AWS_CONFIG_FILE \
        AWS_DEFAULT_REGION \
        AWS_SECRET_ACCESS_KEY \
        AWS_SECURITY_TOKEN \
        AWS_SESSION_DURATION \
        AWS_SESSION_START \
        AWS_SESSION_TOKEN \
        AWS_SESSION_VAULT_LEASE_ID \
        BASTION_USERNAME \
        CLUSTER_DIR \
        CLUSTER_TYPE \
        CLUSTER \
        CONFIG_DIR \
        CUDDLE_GIT_REPO \
        CUDDLEFISH_HOME \
        CUDDLEFISH_INSTALL_CHANNEL \
        CUDDLEFISH_PROJECTS_DIR \
        CUDDLEFISH_REPO_PATH \
        CUDDLEFISH_SESSION_ID \
        CUDDLEFISH_VENV \
        ENABLE_HASHI_VAULT \
        GITHUB_ACCESS_TOKEN \
        INFRASTRUCTURE_BUCKET \
        INFRASTRUCTURE_REPO \
        INVENTORY_CLOUD \
        INVENTORY \
        KUBECONFIG \
        NO_BREW_SAFETY \
        PIP_LOG \
        PROJECT \
        REMOTE_REGISTRY_PASSWORD \
        runner_file \
        USE_AWS_VAULT \
        USE_HASHI_VAULT \
        USE_HASHICORP_VAULT_FOR_AWS_CREDS \
        VAULT_ADDR \
        VAULT_AWS_ACCOUNT \
        VAULT_AWS_ROLE \
        VIRTUAL_ENV_PROMPT \
        VIRTUAL_ENV

    switch "$cmd"

        case auth
            switch "$argv[2]"
                case '' aws
                    command cuddlectl run vault_login >/dev/null
                    # @fish-lsp-disable-next-line
                    eval (cthulhucuddle vault refresh-aws)
                case '*'
                    echo nope
            end

        case web
            switch "$argv[2]"
                case '' aws
                    command cuddlectl run vault_login >/dev/null
                    # @fish-lsp-disable-next-line
                    open (cthulhucuddle vault aws-console)
                case '*'
                    echo nope
            end

        case push
            switch "$argv[2]"
                case '' env
                    # push into tmux session env, prefix with `CDL_` to prevent unintended collisions
                    for cuddlefish_env_name in $cuddlefish_env_names
                        set tmux_env_name "CDL_$cuddlefish_env_name"
                        tmux setenv $tmux_env_name "$$cuddlefish_env_name"
                    end
                case '*'
                    echo nope
            end

        case pull
            switch "$argv[2]"
                case '' env
                    # pull from tmux session env and export into local shell env
                    for cuddlefish_env_name in $cuddlefish_env_names
                        set tmux_env_name "CDL_$cuddlefish_env_name"
                        # pull afresh from tmux session env before exporting into local shell env
                        export (tmux show-environment $tmux_env_name 2>/dev/null || echo NOTFOUND)
                        # export into local shell env
                        export $cuddlefish_env_name="$$tmux_env_name"
                    end
                    # add cuddlefish paths
                    set -gx fish_user_paths $HOME/.cuddlefish/venv/bin $fish_user_paths
                    set -gx fish_user_paths $HOME/.cuddlefish/bin $fish_user_paths
                    set -gx fish_user_paths $HOME/.cuddlefish/venv/lib/python3.14/site-packages/workstation/bin $fish_user_paths
                case '*'
                    echo nope
            end

        case unset
            switch "$argv[2]"
                case '' env
                    # unset local shell env
                    for cuddlefish_env_name in $cuddlefish_env_names
                        set -e "$cuddlefish_env_name"
                        set tmux_env_name "CDL_$cuddlefish_env_name"
                        set -e $tmux_env_name
                    end
                case tmux
                    # unset tmux session env
                    for cuddlefish_env_name in $cuddlefish_env_names
                        set tmux_env_name "CDL_$cuddlefish_env_name"
                        tmux setenv -u $tmux_env_name
                    end
                case '*'
                    echo nope
            end

        case '*'
            command cdl $argv
    end
end
