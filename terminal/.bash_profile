#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# OPAM configuration
. /home/jean/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

#Disable nonworking laptop keyboad
xinput float 14

startx

