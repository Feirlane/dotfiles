# This script is supposed to aotmate the installation process for the config files, just name the programs you want to install the config for, and it'll magically do so

# Each config folder for a different program must have an install.sh doing the actual installation

#Create backup of current file
function backup {
FULLPATH="${2}/${1}"
if [ -e $FULLPATH ]
then
    echo -e "\t${FULLPATH} already exists, backing up to ${FULLPATH}.save"
    cp -R "${FULLPATH}" "${FULLPATH}".save 2>/dev/null
    unlink "${FULLPATH}" 2>/dev/null
    rm -rf "${FULLPATH}" 2>/dev/null
fi

}

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for i in $*
do
    SCRIPTFILE="${DIR}/${i}/install.sh"
    if [ -e ${SCRIPTFILE} ]
    then
        echo "Installing ${i}"
        . ${SCRIPTFILE}
    else
        echo "Skipping nonexistent installer for ${i}"
    fi
done
