SESSION=regulator
PROJECT_DIR=~/projects/nb/regulator

cd $PROJECT_DIR

tmux -2 new-session -d -s $SESSION
tmux rename-window "shell"

tmux new-window -t$SESSION:2 -c $PROJECT_DIR -n "vim"
tmux send-keys "vim" C-m

tmux new-window -t$SESSION:3 -c $PROJECT_DIR -n "vagrant"
tmux send-keys "vagrant up" C-m
tmux send-keys "vagrant ssh" C-m

tmux select-window -t$SESSION:1
tmux -2 attach-session -t $SESSION

