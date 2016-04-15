SESSION=handyman
PROJECT_DIR=~/projects/buntin/handyman

cd $PROJECT_DIR

if (tmux has-session -t "$SESSION" 2> /dev/null); then
  echo "Session $SESSION exists."
  tmux attach -t $SESSION
else
  echo "Starting $SESSION session."
  tmux -2 new-session -d -s $SESSION
  tmux send-keys "cd $PROJECT_DIR" C-m C-l
  tmux rename-window "shell"

  tmux new-window -t$SESSION:2 -c $PROJECT_DIR -n "vim"
  tmux send-keys "vim" C-m

  tmux new-window -t$SESSION:3 -c $PROJECT_DIR -n "server"
  tmux send-keys "npm start" C-m

  tmux select-window -t$SESSION:1
  tmux -2 attach-session -t $SESSION
fi
