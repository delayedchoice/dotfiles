# START:new
tmux new-session -s image-conversion -n editor -d
# END:new
# START:cd
# END:cd
#tmux send-keys -t image-conversion 'cd ~/devproject' C-m
# START:vim
tmux send-keys -t image-conversion 'n -u init.vim src/image_conversion/core.clj' C-m
# END:vim
# START:hsplit
#tmux split-window -v -t image-conversion
#tmux selectp -t 2 
## END:hsplit
## START:layout
#tmux select-layout -t image-conversion main-horizontal
# END:layout
# START:keystopane
#tmux send-keys -t image-conversion:1.2 'cd ~/devproject' C-m
# END:keystopane
# START:newwindow
tmux new-window -n console -t image-conversion
tmux send-keys -t image-conversion 'lein repl' C-m
#tmux send-keys -t image-conversion:2 'cd ~/devproject' C-m
# END:newwindow
# START:selectwindow
tmux select-window -t image-conversion:1
# END:selectwidow
tmux attach -t image-conversion
