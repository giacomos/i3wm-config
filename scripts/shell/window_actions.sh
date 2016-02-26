#!/usr/bin/env menugen

#begin main
prompt="Window actions:"
add_exec 'Floating (toggle)'    'i3-msg "floating toggle"'
add_exec 'Fullscreen (toggle)'    'i3-msg "fullscreen"'
add_exec 'Sticky (toggle)'    'i3-msg "sticky toggle"'
add_exec 'Move to Scratchpad'    'i3-msg "move scratchpad"'
add_exec 'Quit'    'i3-msg "kill"'
#end main
