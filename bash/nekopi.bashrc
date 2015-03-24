#
# Raspi bashrc
#


# Raspberry logo by b3n from http://www.raspberrypi.org/phpBB3/viewtopic.php?p=78678#p78678
echo -n "$(tput setaf 2)
   .~~.   .~~.
  '. \ ' ' / .'$(tput setaf 1)
   .~ .~~~..~.
  : .~.'~'.~. :
 ~ (   ) (   ) ~
( : '~'.~.'~' : )
 ~ .~ (   ) ~. ~
  (  : '~' :  )     $HOSTNAME
   '~ .~~~. ~'
       '~'$(tput sgr0)
"

if [[ -z "$TMUX" ]]; then
    TERM=screen-256color-bce tmux -2 new-session -A -s system && exit 0
    echo "tmux failed! continuing with normal bash startup"
fi
