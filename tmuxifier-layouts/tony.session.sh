session_root "~/projects/buntin/tony"

if initialize_session "tony"; then
  load_window "vim"
  load_window "shell"
  load_window "npm-less"

  select_window 1
fi

finalize_and_go_to_session
