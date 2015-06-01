SESSION=monolith
PROJECT_DIR=~/projects/cicayda/monolith

cd $PROJECT_DIR

if [[ `tmux attach -t $SESSION` ]]; then
  echo "Attaching to session \"$SESSION\""
else
  echo "Creating session \"$SESSION\""
  tmux -2 new-session -d -s $SESSION -n "shell"

  tmux new-window -t$SESSION:2 -n "mutt"
  tmux new-window -t$SESSION:3 -n "cljsbuild"
  tmux new-window -t$SESSION:4 -n "logs"
  tmux new-window -t$SESSION:5 -c vagrant/dev -n "vagrant"
  tmux new-window -t$SESSION:6 -n "runners"
  tmux new-window -t$SESSION:7 -n "vim"

  tmux send-keys -t$SESSION:2 "mutt" C-m

  tmux send-keys -t$SESSION:3 "lein do cljsbuild clean, cljx, cljsbuild auto debug" C-m

  tmux send-keys -t$SESSION:4 "ssh dev \"tail -f /var/log/monolith/monolith.log\"" C-m
  tmux split-window -t$SESSION:4 -v
  tmux send-keys -t$SESSION:4 "ssh dev \"tail -f /var/log/monolith/appserver.upstart.log\"" C-m
  tmux select-layout -t$SESSION:4 even-vertical

  tmux send-keys -t$SESSION:5 "vagrant up" C-m

  tmux send-keys -t$SESSION:6 "observr watchr/less.watch" C-m
  tmux split-window -t$SESSION:6 -v
  tmux send-keys -t$SESSION:6 "ssh -N prod-socks" C-m
  tmux split-window -t$SESSION:6 -v
  tmux send-keys -t$SESSION:6 "ssh -N -L 9009:localhost:9009 dev" C-m
  tmux split-window -t$SESSION:6 -v
  tmux select-layout -t$SESSION:6 even-vertical

  tmux send-keys -t$SESSION:7 "vim project.clj" C-m

  tmux select-window -t$SESSION:1
  tmux attach-session -t $SESSION
fi
