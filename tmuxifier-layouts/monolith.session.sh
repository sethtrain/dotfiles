session_root "~/projects/cicayda/monolith"

if initialize_session "monolith"; then
  load_window "mvim"
  load_window "cljsbuild"
  load_window "monolith-logs"
  load_window "monolith-vagrant"
  load_window "devops"
  load_window "less"

  select_window 1
fi

finalize_and_go_to_session
