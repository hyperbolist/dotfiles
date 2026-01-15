# TODO: fix neovim's fish indentation
function tf -a cmd -d 'Tool to build, change, and version infrastructure'
    switch "$cmd"
        case clean
            set patterns .terraform .terraform.lock.hcl terraform.tfstate* terraform.tfplan*
            rm -rf $patterns

        case write
            terrafish_write_outputs.sh $argv[2]

        case '*'
            command terraform $argv
    end
end
