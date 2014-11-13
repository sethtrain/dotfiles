new_window "logs"

# Split window into panes.
split_v 20

run_cmd "ssh dev \"tail -f /var/log/monolith/monolith.log\"" 1
run_cmd "ssh dev \"tail -f /var/log/monolith/appserver.upstart.log\"" 2

# Set active pane.
select_pane 1
