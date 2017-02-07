#
# Odroid bashrc
#
#                    / )
#                   ( (
#     A.-.A  .-""-.  ) )
#    / , , \/      \/ /
#   =\  t  ;=    /   /
#     `--,'  .""|   /
#         || |  \\ \
#        ((,_|  ((,_\

if [[ -z "$TMUX" ]]; then
    TERM=screen-256color tmux -2 new-session -A -s system && exit 0
    echo "tmux failed! continuing with normal bash startup"
fi
