function brew -a cmd -d 'brew - The Missing Package Manager for macOS'
  switch "$cmd"
    case bundle
      command brew bundle --global --all --describe $argv[2..99]
    case '*'
      command brew $argv
  end
end
