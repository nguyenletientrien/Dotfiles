#!/usr/bin/env bash

# Description: This script help you mount drives easier!
# Dependencies: dmenu, dunst (or your favorite notification-daemon)
# NOTE: you should edit /etc/sudoers to use 'mount' command without password.
# Otherwise you can't run this script with dmenu.
# (see 'Tips and Tricks' in Arch_installation file).

set -euo pipefail

# Check if dmenu is running, exit this bash script.
pgrep -x dmenu && exit

check_drive() {
    if [[ "$mountablename" = "" ]] || [[ "$mountablenumber" = "1" ]]; then
        echo "Cancel" | dmenu -p "WARNING: No drive availabe!"
        exit 1
    fi
}

mount() {
    # If they're in /etc/fstab, they'll be mounted automatically.
    sudo mount "$chosen" && exit 0

    # You may want to change the line below for more suggestions for mounting.
    dirs="$(find /mnt /home -type d -maxdepth 3 2>/dev/null)"
    mountpoint="$(echo "$dirs" | dmenu -i -p "Type in mount point.")"
    [[ "$mountpoint" = "" ]] && exit 1
    if [[ ! -d "$mountpoint" ]]; then
        mkdiryn="$(echo -e "Yes\nNo" | dmenu -i -p "$mountpoint does not exist. Create it?")"
        if [[ "$mkdiryn" = "Yes" ]]; then
            sudo mkdir -p "$mountpoint"
        else
            exit 1
        fi
    fi
    sudo mount "$chosen" "$mountpoint"

    # Format color display with dunst
    chosen_col="<span foreground='#660000'>$chosen</span>"
    mntpnt_col="<span foreground='#660000'>$mountpoint</span>"

    pgrep -x dunst && notify-send "Mount Drive" "$chosen_col\nmounted to:\n$mntpnt_col"
}

main() {
    mountablename="$(lsblk -lp | grep "part $\|disk $" | awk '{print $1, "(" $4 ")"}')"
    mountablenumber="$(echo "$mountablename" | wc -l)"
    
    check_drive
    
    chosen="$(echo "$mountablename" | dmenu -i -p "Mount which drive?" | awk '{print $1}')"
    [[ "$chosen" = "" ]] && exit 1
    
    mount
}

[[ "${BASH_SOURCE[0]}" == "${0}" ]] && main "$@"
