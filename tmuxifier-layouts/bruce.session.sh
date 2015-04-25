session_root "~/projects/buntin/bruce"

if initialize_session "bruce"; then
  load_window "mvim"
  load_window "figwheel"
  #load_window "electron"
  load_window "less"

  select_window 1
fi

finalize_and_go_to_session
