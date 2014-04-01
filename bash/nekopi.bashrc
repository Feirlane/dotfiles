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

if [ "$PS1" != "" -a $TERM != "screen" -a "${STARTED_SCREEN:-x}" = x -a "${SSH_TTY:-x}" != x ]
then
  STARTED_SCREEN=1 ; export STARTED_SCREEN
  [ -d $HOME/lib/screen-logs ] || mkdir -p $HOME/lib/screen-logs
  sleep 1
  screen -RR && exit 0
  # normally, execution of this rc script ends here...
  echo "Screen failed! continuing with normal bash startup"
fi
