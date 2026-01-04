function kubectl -a cmd -d 'kubectl controls the Kubernetes cluster manager.'
  switch "$cmd"
    case all
      command kubectl get (kubectl api-resources --no-headers --namespaced=true --verbs list | grep -v Event | grep -v Binding | sort | awk -v ORS=, '{ print $1 }' | sed 's/,$//') $argv[2..-1]

    case cx
      kubectl context $argv[2]

    case context
      if set -q argv[2]
        command kubectl config use-context "$argv[2]"
      else
        command kubectl config current-context
      end

    case contexts
      command kubectl config get-contexts $argv[2..-1]

    # used for completion
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

    # used for completion
    case namespaces
      command kubectl get namespace --output=jsonpath='{.items[*].metadata.name}' | tr -s '[[:space:]]' '\n' | $PAGER

    case keys
      kubectl secret-keys $argv[2]
    case secret-keys
      command kubectl get secret $argv[2] -oyaml | yq '.data | keys | .[]'

    case value
      kubectl secret-value $argv[2] $argv[3]
    case secret-value
      command kubectl get secret $argv[2] -oyaml | yq .data | yq .\"$argv[3]\" | base64 -d

    case values
      kubectl secret-values $argv[2]
    case secret-values
      for key in (kubectl keys $argv[2])
        echo -n "$key: " && kubectl value $argv[2] $key && echo
      end

    case unset-context
      command kubectl config unset current-context

    case unset-namespace
      command kubectl config set-context --current --namespace=

    case images
      command kubectl get pods -o jsonpath="{.items[*].spec.containers[*].image}" $argv[2..-1] | tr -s "[[:space:]]" "\n" | sort | uniq -c

    case '*'
      command kubectl $argv
  end
end

complete -f -c k -n "__fish_seen_subcommand_from namespace; and not __fish_seen_subcommand_from (k namespaces)" -a "(k namespaces)"
complete -f -c k -n "__fish_seen_subcommand_from ns; and not __fish_seen_subcommand_from (k namespaces)" -a "(k namespaces)"

complete -f -c k -n "__fish_seen_subcommand_from context; and not __fish_seen_subcommand_from (k context-names)" -a "(k context-names)"
complete -f -c k -n "__fish_seen_subcommand_from cx; and not __fish_seen_subcommand_from (k context-names)" -a "(k context-names)"
