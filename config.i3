# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod1

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
# font pango:monospace 8

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
font pango:DejaVu Sans Mono 10

# Before i3 v4.8, we used to recommend this one as the default:
# font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
# The font above is very space-efficient, that is, it looks good, sharp and
# clear in small sizes. However, its unicode glyph coverage is limited, the old
# X core fonts rendering does not support right-to-left and this being a bitmap
# font, it doesn’t scale on retina/hidpi displays.

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
# bindsym $mod+d exec dmenu_run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
bindsym $mod+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+o split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym h resize shrink width 10 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3status
        tray_padding 3
        tray_output primary

        position top

        font pango:Roboto 10
}

# Colors
client.focused          #1A1A1A #8C8587 #1A1A1A #8C8587
client.focused_inactive #1A1A1A #1A1A1A #1A1A1A #1A1A1A
client.unfocused        #1A1A1A #1A1A1A #77438F #1A1A1A
client.urgent           #3B89B5 #3B89B5 #a5a5a5 #1A1A1A
client.background       #1A1A1A

# Common apps
bindsym $mod+i exec --no-startup-id google-chrome
bindsym $mod+n exec nautilus

# Powermode
set $fisical Control
set $power_mode "(p)oweroff, (r)eboot, (l)ock, (q)uit, (h)ibernate, (s)leep"
bindsym $fisical+Shift+q      mode $power_mode
mode $power_mode {

	bindsym p        exec systemctl poweroff
		bindsym r        exec systemctl reboot 
		bindsym l        exec i3lock-fancy -- scrot -z
		bindsym q        exec --no-startup-id i3-msg exit, mode "default"
		bindsym h        exec systemctl hibernate 
		bindsym s        exec systemctl hybrid-sleep 

		bindsym Return    mode "default"
		bindsym Escape    mode "default"
}

#i3lock autolock
exec_always --no-startup-id xautolock -time 1  -locker "i3lock-fancy -- scrot -z  && sleep 1"-killtime 10 -killer "systemctl suspend"  -detectsleep 

#Startup application
exec --no-startup-id dropbox start
