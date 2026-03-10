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
    great_lakes_node_name="${1}" # "${1:-gl0005}"
    # vnc_port="${2:-63967}"
    vnc_port="${2}"
	if [[ -z $great_lakes_node_name ]]; then
		read -p "Enter great_lakes_node_name: " great_lakes_node_name
	fi

    if [[ -n $vnc_port ]]; then
        ssh -f -N -L "${vnc_port}":"${great_lakes_node_name}".arc-ts.umich.edu:5902 -L 8889:"${great_lakes_node_name}".arc-ts.umich.edu:8889 halechr@gl-campus-login.arc-ts.umich.edu
    else
        ssh -f -N -L 8889:"${great_lakes_node_name}".arc-ts.umich.edu:8889 halechr@gl-campus-login.arc-ts.umich.edu
    fi
}



# ssh_supercomputer_tunnel gl3142 13809

# OnDemand "native VNC" (greatlakes.arc-ts.umich.edu, remote port 5901). Distinct from ssh_supercomputer_tunnel (gl-campus-login, 5902).
function ondemand_vnc_tunnel () {
	local local_port node_name vnc_password pasted
	pasted="${1:-}"
	if [[ -n "$pasted" && "$pasted" =~ -L[[:space:]]+([0-9]+):(gl[0-9]+)\.arc-ts\.umich\.edu:5901 ]]; then
		local_port="${BASH_REMATCH[1]}"
		node_name="${BASH_REMATCH[2]}"
		vnc_password="${2:-}"
	else
		local_port="${1:-}"
		node_name="${2:-}"
		vnc_password="${3:-}"
	fi
	if [[ -z $local_port ]]; then
		read -p "Enter local_port (e.g. 24104): " local_port
	fi
	if [[ -z $node_name ]]; then
		read -p "Enter great_lakes_node_name (e.g. gl3467): " node_name
	fi
	ssh -f -N -L "${local_port}:${node_name}.arc-ts.umich.edu:5901" halechr@greatlakes.arc-ts.umich.edu
	if [[ -n "$vnc_password" ]]; then
		echo "VNC password (paste into client): $vnc_password"
	fi
	if [[ -n "${PHO_VNC_VIEWER:-}" ]]; then
		$PHO_VNC_VIEWER "localhost::${local_port}"
	elif command -v vncviewer &>/dev/null; then
		vncviewer "localhost::${local_port}"
	elif command -v remmina &>/dev/null; then
		remmina -c "vnc://localhost:${local_port}"
	else
		echo "Connect VNC client to localhost:${local_port}"
	fi
}


function ssh_lab_workstation () {
    ssh halechr@RDLU0039.ddns.med.umich.edu
    # rdlu0039.ddns.med.umich.edu
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


# ssh halechr@gl0001.arc-ts.umich.edu -A

# To close the ssh connection:
# ps aux | grep ssh

# halechr   281767  0.0  0.0 231004  5004 ?        Ss   10:23   0:00 ssh -f -N -L 63967:gl0005.arc-ts.umich.edu:5902 -L 8889:gl0005.arc-ts.umich.edu:8889 halechr@gl-campus-login.arc-ts.umich.edu
# halechr   286201  0.0  0.0 231004  5132 ?        Ss   10:31   0:00 ssh -f -N -L 8889:gl0001.arc-ts.umich.edu:8889 halechr@gl-campus-login.arc-ts.umich.edu
# halechr   286620  0.0  0.0 231004  4996 ?        Ss   10:33   0:00 ssh -f -N -L 8889:gl0001.arc-ts.umich.edu:8889 halechr@gl-campus-login.arc-ts.umich.edu

# kill 281767



