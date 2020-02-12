Installation
------------

follow these steps to configure i3

  1. First backup the current config file:

     ```console
     conf=$HOME/.i3/config
     mv $conf $conf.backup
     ```

  2. Remove the current lock screen settings

     ```console
     sed '/^# Lock/,/^\s*$/d' $conf.backup > $conf.temp
     sed '/blurlock/d' $conf.temp > $conf
     rm $conf.temp
     ```

  3. Get the names of your monitors and set them in i3 config:

     ```console
     xrandr | grep " connected " | awk '{ print$1 }'
     ```

     For each monitor write:

     ```console
     printf "\nset \$monitorX display_name\n"
     ```

     X being the display number.
     Set one of your monitor to an environment variable, we will need it later for tests:

     ```console
     export m='display_name'
     ```

  4. install xidlehook if not already there and copy the xidlehook config at the end
  of the i3 config file:

     ```console
     yay xidlehook
     printf "\n# Lock screen\nexec_always --no-startup-id xidlehook --not-when-audio --not-when-fullscreen\ \n--timer 120 'xrandr --output '\$monitor1' --brightness .3 --output '\$monitor2' --brightness .3'\ \n'xrandr --output '\$monitor1' --brightness 1 --output '\$monitor2' --brightness 1'\ \n--timer 15 'blurlock' 'xrandr --output '\$monitor1' --brightness 1 --output '\$monitor2' --brightness 1'\ \n--timer 3600 'systemctl suspend' 'xrandr --output '\$monitor1' --brightness 1 --output '\$monitor2' --brightness 1'\n" >> $conf
     ```

     Note: This is an example for a 2-monitors setup, adapt it to your needs. Also, test if
     the --not-when-audio flag works on your device and add/remove it, same goes for the
     --not-when-fullscreen flag. To test, try running:

     ```console
     xidlehook --not-when-audio --not-when-fullscreen --timer 1 '--xrandr --output $m --brightness .3' '--xrandr --output $m --brightness 1'
     ```

  5. (Optional) You can associate workspace to specific screens:

     ```console
     printf "# Associate workspace to screens\nworkspace 1 output $monitor1\nworkspace 2 output $monitor1\nworkspace 3 output $monitor1\nworkspace 4 output $monitor1\nworkspace 5 output $monitor2\nworkspace 6 output $monitor2\nworkspace 7 output $monitor2\nworkspace 8 output $monitor2" >> $conf
     ```

     Note: Again, this an example for a 2-monitors setup. Change to your needs, if you only have one
     monitor, do not use

  6. (Optional) Autostart some applications on specific workspaces:

     ```console
     printf "# Autostart applications\nexec i3-msg 'workspace 1;\nexec firefox' exec i3-msg 'workspace 5;\nexec slack' exec i3-msg 'workspace 6;\nexec thunderbird' exec i3-msg 'workspace 7;\nexec anydesk >> $conf"
     ```

