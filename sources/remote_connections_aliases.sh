#!/bin/bash

# function ssh_supercomputer_tunnel () {
#     great_lakes_node_name=gl0005
# 	vnc_port=63967
# 	ssh -f -N -L "${vnc_port}":"${great_lakes_node_name}".arc-ts.umich.edu:5902 -L 8889:"${great_lakes_node_name}".arc-ts.umich.edu:8889 halechr@gl-campus-login.arc-ts.umich.edu # Forwards port 5902 on the remote machine to port "${vnc_port}" on local
# 	# Forwards port 8889 on remote to 8889 on local (for jupyter-lab)
# }




function ssh_supercomputer () {
    ssh halechr@greatlakes.arc-ts.umich.edu
}


function ssh_supercomputer_tunnel () {
	# Explanation: 
	# - The `read` command prompts the user to enter a value for `great_lakes_node_name`.
	# - The `if` statement checks if `vnc_port` is not empty. If it is not empty, the `-L ${vnc_port}:"${great_lakes_node_name}".arc-ts.umich.edu:5902` portion is included in the SSH command. If it is empty, this portion is skipped.
	# - The SSH command is
    great_lakes_node_name="${1:-gl0005}"
    vnc_port="${2:-63967}"
	# if [[ -n $great_lakes_node_name ]]; then
	# 	read -p "Enter great_lakes_node_name: " great_lakes_node_name
	# fi

    if [[ -n $vnc_port ]]; then
        ssh -f -N -L "${vnc_port}":"${great_lakes_node_name}".arc-ts.umich.edu:5902 -L 8889:"${great_lakes_node_name}".arc-ts.umich.edu:8889 halechr@gl-campus-login.arc-ts.umich.edu
    else
        ssh -f -N -L 8889:"${great_lakes_node_name}".arc-ts.umich.edu:8889 halechr@gl-campus-login.arc-ts.umich.edu
    fi
}


# Please modify the following Bash function to prompt the user for `great_lakes_node_name` if it isn't provided. Also make `vnc_port` optional and drop the relevant -L portion of the command if it isn't provided.
# ```bash
# function ssh_supercomputer_tunnel () {
#     great_lakes_node_name=gl0005
# 	vnc_port=63967
# 	ssh -f -N -L "${vnc_port}":"${great_lakes_node_name}".arc-ts.umich.edu:5902 -L 8889:"${great_lakes_node_name}".arc-ts.umich.edu:8889 halechr@gl-campus-login.arc-ts.umich.edu # Forwards port 5902 on the remote machine to port "${vnc_port}" on local
# 	# Forwards port 8889 on remote to 8889 on local (for jupyter-lab)
# }
# ```



