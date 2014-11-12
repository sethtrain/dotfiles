# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/projects/cicayda/devops"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "devops"; then

  # Create a new window inline within session layout definition.
  #new_window "misc"

  # Load a defined window layout.
  load_window "vim"
  load_window "shell"
  load_window "socks"
  load_window "bastion"
  load_window "devops-vagrant"
  load_window "monolith"

  # Select the default active window on session creation.
  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
