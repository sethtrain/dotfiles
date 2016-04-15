SESSION=fishface
PROJECT_DIR=~/projects/buntin/fishface

cd $PROJECT_DIR

tmux -2 new-session -d -s $SESSION
tmux send-keys "cd $PROJECT_DIR" C-m C-l
tmux rename-window "shell"

tmux new-window -t$SESSION:2 -c $PROJECT_DIR -n "influx"
tmux send-keys "influx" C-m C-l

tmux new-window -t$SESSION:3 -c $PROJECT_DIR -n "server"
tmux send-keys C-l "lein ring server-headless 4000" C-m

tmux new-window -t$SESSION:4 -c $PROJECT_DIR -n "docker"
tmux send-keys C-l "eval \"$(docker-machine env fishface)\" && docker run -i -p 3000:3000 grafana/grafana" C-m

tmux select-window -t$SESSION:1
tmux -2 attach-session -t $SESSION

