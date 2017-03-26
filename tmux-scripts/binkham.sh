SESSION=binkham
PROJECT_DIR=~/projects/buntin/binkham

cd $PROJECT_DIR

if (tmux has-session -t "$SESSION" 2> /dev/null); then
  echo "Session $SESSION exists."
  tmux attach -t $SESSION
else
  tmux -2 new-session -d -s $SESSION
  tmux rename-window "shell"
  tmux send-keys "workon $SESSION" C-m

  tmux new-window -t$SESSION:2 -c $PROJECT_DIR -n "nvim"
  tmux send-keys "nvim" C-m

  tmux new-window -t$SESSION:3 -c $PROJECT_DIR -n "docker"
  tmux send-keys "docker-compose up" C-m

  tmux new-window -t$SESSION:4 -c $PROJECT_DIR -n "server"
  tmux send-keys "workon $SESSION && ./manage.py runserver" C-m

  tmux select-window -t$SESSION:1
  tmux -2 attach-session -t $SESSION
fi
