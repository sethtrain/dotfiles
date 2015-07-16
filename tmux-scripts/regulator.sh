SESSION=regulator
PROJECT_DIR=/regulator

cd $PROJECT_DIR

if (tmux has-session -t "$SESSION" 2> /dev/null); then
  echo "Session $SESSION exists."
  tmux attach -t $SESSION
else
  tmux -2 new-session -d -s $SESSION
  tmux rename-window "shell"

  tmux new-window -t$SESSION:2 -c $PROJECT_DIR -n "vim"
  tmux send-keys "vim" C-m

  tmux select-window -t$SESSION:1
  tmux -2 attach-session -t $SESSION
fi
