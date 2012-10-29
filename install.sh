#This script is supposed to aotmate the installation process for the config files, just name the programs you want to install the config for, and it'll magically do so

#Create backup of current file
function backup {
if [ -e $2/$1 ]
then
    echo "Backing up $1 to $1.save"
    cp $2/$1 $2/$1.save 2>/dev/null
    unlink $2/$1 2>/dev/null
    rm $2/$1 2>/dev/null
fi

}

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for i in $*
do
    echo "Parsing $i"
    case $i in
        *bash*)
            backup ".bashrc" $HOME
            ln -s $DIR/bash/bashrc $HOME/.bashrc
            ;;
        *emacs*)
            backup ".emacs" $HOME
            ln -s $DIR/emacs/emacs $HOME/.emacs
            ;;
    esac
done
