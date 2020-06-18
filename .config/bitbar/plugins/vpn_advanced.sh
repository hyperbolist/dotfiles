#!/bin/bash
# adapted from https://github.com/matryer/bitbar-plugins/blob/master/Network/vpn_advanced.sh

# Get current status of a VPN connection with options to connect/disconnect.
# Working with OpenConnect, but can work with any executable VPN. Commands
# that require admin permissions should be whitelisted with 'visudo', e.g.:
#
#joesmith ALL=(ALL) NOPASSWD: /usr/local/bin/openconnect
#joesmith ALL=(ALL) NOPASSWD: /usr/bin/killall -2 openconnect

# <bitbar.title>VPN Status</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Jesse Jarzynka</bitbar.author>
# <bitbar.author.github>jessejoe</bitbar.author.github>
# <bitbar.desc>Displays status of a VPN interface with option to connect/disconnect.</bitbar.desc>
# <bitbar.image>http://i.imgur.com/RkmptwO.png</bitbar.image>

VPN_EXECUTABLE=/usr/local/bin/openconnect
#VPN_EXECUTABLE_PARAMS="--authgroup Employee_VPN --no-dtls" # Optional
VPN_EXECUTABLE_PARAMS="--authgroup Sy_CTS --no-dtls" # "Sy_CTS" is required for reaching voip boxes
VPN_HOST="https://covpn.pgi.com"
VPN_USERNAME="eric.sherman@pgi.com"
GET_VPN_PASSWORD="osascript -e 'display dialog \"Domain Password\" with hidden answer default answer \"\"' -e 'text returned of result' 2>/dev/null"
# Command to determine if VPN is connected or disconnected
VPN_CONNECTED="/sbin/ifconfig | grep ' 10\.'"
# Command to run to disconnect VPN
VPN_DISCONNECT_CMD="sudo /usr/bin/killall -2 openconnect"

case "$1" in
    connect)
        VPN_PASSWORD=$(eval "$GET_VPN_PASSWORD")
        # VPN connection command, should eventually result in $VPN_CONNECTED,
        # may need to be modified for VPN clients other than openconnect
        INVOCATION="echo '$VPN_PASSWORD' | sudo $VPN_EXECUTABLE $VPN_EXECUTABLE_PARAMS --user $VPN_USERNAME --passwd-on-stdin $VPN_HOST &> /dev/null &"
        eval "$INVOCATION"
        # Wait for connection so menu item refreshes instantly
        # TODO give up after X seconds
        until eval "$VPN_CONNECTED"; do sleep 1; done
        ;;
    disconnect)
        eval "$VPN_DISCONNECT_CMD"
        # Wait for disconnection so menu item refreshes instantly
        # TODO give up after X seconds
        until [ -z "$(eval "$VPN_CONNECTED")" ]; do sleep 1; done
        ;;
esac

if [ -n "$(eval "$VPN_CONNECTED")" ]; then
    echo "VPN ✔"
    echo '---'
    echo "Disconnect VPN | bash='$0' param1=disconnect terminal=false refresh=true"
    exit
else
    echo "VPN ✘"
    echo '---'
    echo "Connect VPN | bash='$0' param1=connect terminal=false refresh=true"
    exit
fi
