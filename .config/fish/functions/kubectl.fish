function kubectl -a cmd -d 'kubectl controls the Kubernetes cluster manager.'
  switch "$cmd"
    case cx
      kubectl context $argv[2]

    case context
      if set -q argv[2]
        command kubectl config use-context "$argv[2]"
      else
        command kubectl config current-context
      end

    case contexts
      command kubectl config get-contexts

    case context-names
      command kubectl config get-contexts --output=name

    case ns
      kubectl namespace $argv[2]

    case namespace
      if set -q argv[2]
        command kubectl config set-context --current --namespace "$argv[2]"
      else
        command kubectl config view --minify --output 'jsonpath={..namespace}'
      end

    case namespaces
      command kubectl get namespace --output=jsonpath='{.items[*].metadata.name}' | tr -s '[[:space:]]' '\n' | $PAGER

    case unset-context
      command kubectl config unset current-context

    case '*'
      command kubectl $argv
  end
end

complete -f -c k -n "__fish_seen_subcommand_from namespace; and not __fish_seen_subcommand_from (k namespaces)" -a "(k namespaces)"
complete -f -c k -n "__fish_seen_subcommand_from ns; and not __fish_seen_subcommand_from (k namespaces)" -a "(k namespaces)"

complete -f -c k -n "__fish_seen_subcommand_from context; and not __fish_seen_subcommand_from (k context-names)" -a "(k context-names)"
complete -f -c k -n "__fish_seen_subcommand_from cx; and not __fish_seen_subcommand_from (k context-names)" -a "(k context-names)"
