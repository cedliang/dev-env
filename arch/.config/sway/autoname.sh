#!/usr/bin/env zsh
# config: exec_always ~/.config/sway/autoname.sh

# Do not forget to change the path according to the script location!
pkill -f "python3 $HOME/.config/sway/autoname.py"
~/.config/sway/autoname.py &
