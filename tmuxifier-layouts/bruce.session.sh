session_root "~/projects/buntin/bruce"

if initialize_session "bruce"; then
  load_window "vim"
  load_window "http-server"
  load_window "npm-start"
  load_window "npm-less"

  select_window 1
fi

finalize_and_go_to_session
