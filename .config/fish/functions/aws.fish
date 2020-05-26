# adapted from https://github.com/oh-my-fish/plugin-aws
# added region handling
function aws -a cmd -d 'Universal CLI for AWS'
  switch "$cmd"
    case profile
      if set -q argv[2]
        set -gx AWS_PROFILE "$argv[2]"
      else
        echo $AWS_PROFILE
      end

    case profiles
      command sed -n -e 's/^\[\(.*\)\]/\1/p' "$HOME/.aws/credentials"

    case unset-profile
      set -e AWS_PROFILE

    case inject
      if set -q AWS_PROFILE
        set -gx AWS_ACCESS_KEY_ID (aws configure --profile $AWS_PROFILE get aws_access_key_id)
        set -gx AWS_SECRET_ACCESS_KEY (aws configure --profile $AWS_PROFILE get aws_secret_access_key)
      else
        echo "AWS_PROFILE not set"
      end

    case uninject
      set -e AWS_ACCESS_KEY_ID
      set -e AWS_SECRET_ACCESS_KEY

    case region
      if set -q argv[2]
        aws configure set region "$argv[2]"
      else
        aws configure get region
      end

    case regions
      if set -q AWS_PROFILE; or set -q AWS_ACCESS_KEY_ID
        command aws ec2 --region=us-west-2 describe-regions | jq -r '.Regions[].RegionName'
      else
        echo "AWS_PROFILE not set, and no AWS creds in environment"
      end

    case '*'
      command aws $argv
  end
end

function __aws_complete_root
  test (count (commandline -o)) = 1
end

function __aws_complete
  if set -q aws_completer_path
    set -lx COMP_SHELL fish
    set -lx COMP_LINE (commandline)

    eval $aws_completer_path | command sed 's/ $//'
  end
end

complete --command aws --no-files --arguments '(__aws_complete)'
complete --command aws --no-files --condition '__aws_complete_root' --arguments profile -d 'Get or set current profile'
complete --command aws --no-files --condition '__aws_complete_root' --arguments unset-profile -d 'Unset AWS_PROFILE'
complete --command aws --no-files --condition '__aws_complete_root' --arguments inject -d 'Set AWS creds env vars'
complete --command aws --no-files --condition '__aws_complete_root' --arguments uninject -d 'Unset AWS creds env vars'
complete --command aws --no-files --condition '__aws_complete_root' --arguments region -d 'Get or set current region'
complete --command aws --no-files --condition '__aws_complete_root' --arguments regions -d 'Get list of regions'
complete --command aws --no-files --condition '__fish_seen_subcommand_from profile' --arguments '(aws profiles)'
complete --command aws --no-files --condition '__fish_seen_subcommand_from region' --arguments '(aws regions)'
