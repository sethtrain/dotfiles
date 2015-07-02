SESSION=nbuild
PROJECT_DIR=~/projects/nb/nbuild

cd $PROJECT_DIR

tmux -2 new-session -d -s $SESSION
tmux send-keys "cd $PROJECT_DIR" C-m C-l
tmux rename-window "shell"

tmux new-window -t$SESSION:2 -c $PROJECT_DIR -n "vim"
tmux send-keys "vim" C-m

tmux new-window -t$SESSION:3 -c $PROJECT_DIR -n "console"
tmux send-keys "rails c" C-m C-l

tmux new-window -t$SESSION:4 -c $PROJECT_DIR -n "server"
tmux send-keys C-l "rails s" C-m

tmux select-window -t$SESSION:1
tmux -2 attach-session -t $SESSION

