SESSION=monolith
PROJECT_DIR=~/projects/cicayda/monolith

cd $PROJECT_DIR

tmux -2 new-session -d -s $SESSION
tmux send-keys "cd $PROJECT_DIR" C-m C-o C-l
tmux rename-window "shell"

tmux new-window -t$SESSION:2 -c $PROJECT_DIR -n "mutt"
tmux send-keys C-o C-l
tmux send-keys "mutt" C-m

tmux new-window -t$SESSION:3 -c $PROJECT_DIR -n "cljsbuild"
tmux send-keys C-o C-l
tmux send-keys "lein do cljsbuild clean, cljx, cljsbuild auto debug" C-m

tmux new-window -t$SESSION:4 -c $PROJECT_DIR -n "logs"
tmux send-keys C-o C-l
tmux send-keys "ssh dev \"tail -f /var/log/monolith/monolith.log\"" C-m
tmux split-window -v
tmux resize-pane -D 10
tmux send-keys C-o C-l
tmux send-keys "ssh dev \"tail -f /var/log/monolith/appserver.upstart.log\"" C-m

tmux new-window -t$SESSION:5 -c $PROJECT_DIR/vagrant/dev -n "vagrant"
tmux send-keys C-o C-l "vagrant up" C-m

tmux new-window -t$SESSION:6 -c $PROJECT_DIR -n "runners"
tmux send-keys C-o C-l
tmux send-keys "observr watchr/less.watch" C-m
tmux split-window -v
tmux send-keys C-o C-l
tmux send-keys "ssh -N prod-socks" C-m
tmux split-window -v
tmux send-keys C-o C-l

tmux new-window -t$SESSION:7 -c $PROJECT_DIR -n "nvim"
tmux send-keys C-o C-l
tmux send-keys "nvim project.clj" C-m

tmux select-window -t$SESSION:1
tmux -2 attach-session -t $SESSION
