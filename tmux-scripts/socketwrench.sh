SESSION=socketwrench
PROJECT_DIR=~/projects/buntin/socketwrench

cd $PROJECT_DIR

if (tmux has-session -t "$SESSION" 2> /dev/null); then
  echo "Session $SESSION exists."
  tmux attach -t $SESSION
else
  tmux -2 new-session -d -s $SESSION
  tmux send-keys "cd $PROJECT_DIR" C-m C-l
  tmux send-keys "workon $SESSION" C-m C-l
  tmux rename-window "shell"

  tmux new-window -t$SESSION:2 -c $PROJECT_DIR -n "vim"
  tmux send-keys "workon $SESSION" C-m C-l
  tmux send-keys "vim" C-m C-l

  tmux new-window -t$SESSION:3 -c $PROJECT_DIR/$SESSION -n "servers"
  tmux send-keys "workon $SESSION" C-m C-l
  tmux send-keys C-l "./manage.py runserver 0.0.0.0:8888" C-m
  tmux split-window -v
  tmux send-keys C-l "cd client && npm run webpack" C-m

  tmux select-window -t$SESSION:1
  tmux -2 attach-session -t $SESSION
fi
