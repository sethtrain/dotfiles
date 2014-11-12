session_root "~/projects/cicayda/devops"

if initialize_session "devops"; then
  load_window "vim"
  load_window "shell"
  load_window "socks"
  load_window "bastion"
  load_window "devops-vagrant"
  load_window "monolith"

  select_window 1
fi

finalize_and_go_to_session
