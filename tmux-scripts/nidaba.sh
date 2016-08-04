SESSION=nidaba
PROJECT_DIR=~/projects/emma/nidaba

cd $PROJECT_DIR

if (tmux has-session -t "$SESSION" 2> /dev/null); then
  echo "Session $SESSION exists."
  tmux attach -t $SESSION
else
  tmux -2 new-session -d -s $SESSION
  tmux send-keys "cd $PROJECT_DIR" C-m C-l
  tmux rename-window "shell"

  tmux select-window -t$SESSION:1
  tmux -2 attach-session -t $SESSION
fi
