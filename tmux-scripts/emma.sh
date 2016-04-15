SESSION=emma
PROJECT_DIR=~/projects/emma/emma

cd $PROJECT_DIR

if (tmux has-session -t "$SESSION" 2> /dev/null); then
  echo "Session $SESSION exists."
  tmux attach -t $SESSION
else
  tmux -2 new-session -d -s $SESSION
  tmux send-keys "cd $PROJECT_DIR" C-m C-l
  tmux rename-window "shell"

  tmux new-window -t$SESSION:2 -c $PROJECT_DIR -n "LocalEmma"
  tmux send-keys "cd ../LocalEmma && vagrant up" C-m C-l

  tmux new-window -t$SESSION:3 -c $PROJECT_DIR -n "logs"
  tmux send-keys C-l "ssh -o ConnectTimeout=240 emma27 \"tail -f /var/log/apache2/apache2-errors.log\"" C-m

  tmux select-window -t$SESSION:1
  tmux -2 attach-session -t $SESSION
fi
