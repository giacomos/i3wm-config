#!/usr/bin/env menugen

#begin main
prompt="Select:"
add_exec 'Sleep (lockscreen)'        'i3lock -c 24364F'
add_exec 'Logout'       'i3-msg exit > /dev/null'
add_exec 'Suspend'      'systemctl suspend'
add_exec 'Hibernate'    'systemctl hibernate'
add_exec 'Reboot'       'systemctl reboot'
add_exec 'PowerOff'     'systemctl poweroff'
#end main
