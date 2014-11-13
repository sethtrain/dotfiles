new_window "logs"

# Split window into panes.
split_v 50

run_cmd "ssh dev \"tail -f /var/log/monolith/monolith.log\""
run_cmd "ssh dev \"tail -f /var/log/monolith/appserver.upstart.log\"" 1

# Set active pane.
select_pane 0
