#!/usr/bin/env menugen

#begin main
prompt="Layout:"
add_exec 'default'    'i3-msg layout default > /dev/null'
add_exec 'stacked'    'i3-msg layout stacked > /dev/null'
add_exec 'stacking'    'i3-msg layout stacking > /dev/null'
add_exec 'tabbed'    'i3-msg layout tabbed > /dev/null'
add_exec 'splitv'    'i3-msg layout splitv > /dev/null'
add_exec 'splith'    'i3-msg layout splith > /dev/null'
add_exec 'toggle'    'i3-msg layout toggle > /dev/null'
#end main
