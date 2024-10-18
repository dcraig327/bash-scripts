#!/bin/bash

#focus existing kitty os window or create & focus if n/a
good_kitty () {
  kitten @ focus-window --to unix:/tmp/mykitty &> /dev/null
  if [ $? -ne 0 ]; then
    kitty --detach --directory="~" -o allow_remote_control=yes --listen-on unix:/tmp/mykitty
  fi
  kitten @ focus-window --to unix:/tmp/mykitty &> /dev/null
}

#focus new kitty tab in existing kitty os window
hello_kitty () {
  kitten @ launch --type=tab --to unix:/tmp/mykitty &> /dev/null
  if [ $? -eq 0 ]; then
    kitten @ focus-window --to unix:/tmp/mykitty &> /dev/null
  else
    good_kitty
  fi
}

hello_kitty