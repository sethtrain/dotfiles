SESSION=eda-contacts
PROJECT_DIR=~/projects/emma/eda-contacts

cd $PROJECT_DIR

if (tmux has-session -t "$SESSION" 2> /dev/null); then
  echo "Session $SESSION exists."
  tmux attach -t $SESSION
else
  tmux -2 new-session -d -s $SESSION
  tmux send-keys "cd $PROJECT_DIR" C-m C-l
  tmux send-keys "eval $(dinghy env)" C-m C-l
  tmux send-keys "vim" C-m C-l
  tmux rename-window "vim"

  tmux new-window -t$SESSION:2 -c $PROJECT_DIR -n "docker"
  tmux send-keys "eval $(dinghy env)" C-m C-l
  tmux send-keys "docker-compose up" C-m C-l

  tmux new-window -t$SESSION:3 -c $PROJECT_DIR -n "shell"
  tmux send-keys "eval $(dinghy env)" C-m C-l
  tmux send-keys C-l "" C-m

  tmux select-window -t$SESSION:1
  tmux -2 attach-session -t $SESSION
fi

