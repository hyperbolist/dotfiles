# adapted from http://help.beatunes.com/kb/troubleshooting/macos-how-do-i-stop-itunes-from-reacting-to-media-keys
# disable to prevent bluetooth devices from auto-playing music
function rcd -a cmd -d 'Enables or disables remote control daemon'
  switch "$cmd"
    case disable
      launchctl stop com.apple.rcd
      launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

    case enable
      launchctl load -w /System/Library/LaunchAgents/com.apple.rcd.plist
      launchctl start com.apple.rcd
  end
end

