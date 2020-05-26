# adapted from https://github.com/oh-my-fish/plugin-aws
function docker -a cmd -d 'A self-sufficient runtime for containers'
  switch "$cmd"
    case aws-login
      set AWS_ACCOUNT (aws sts get-caller-identity --query 'Account' --output text)
      set AWS_REGION  (aws configure get region)
      aws ecr get-login-password | docker login -u AWS --password-stdin "https://$AWS_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com"

    case '*'
      command docker $argv
  end
end

