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
    case $i in
        *bash*)
            echo "Installing $i..."
            backup ".bashrc" $HOME
            ln -s $DIR/bash/bashrc $HOME/.bashrc
            ;;
        *emacs*)
            echo "Installing $i..."
            backup ".emacs" $HOME
            ln -s $DIR/emacs/emacs $HOME/.emacs
            ;;
        *git*)
            echo "Installing $i..."
            backup ".gitconfig" $HOME
            ln -s $DIR/git/gitconfig $HOME/.gitconfig
            ;;
	*vim*)
            echo "Installing $i..."
            backup ".vimrc" $HOME
            ln -s $DIR/vim/vimrc $HOME/.vimrc
            ;;
        *screen*)
            echo "Installing $i..."
            backup ".screenrc" $HOME
            ln -s $DIR/screen/screenrc $HOME/.screenrc
            ;;
        *clear*)
            echo "Clearing backups..."
            rm $HOME/.*.save
            ;;
    esac
done
