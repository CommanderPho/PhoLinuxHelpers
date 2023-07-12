# Port Forwarding to GreatLakes


## native_VNC_to_GreatLakes
ssh -f -N -L 47005:gl0003.arc-ts.umich.edu:5919 halechr@gl-campus-login.arc-ts.umich.edu



Open a VNC client and connect to localhost:47005 within the client

Use the VNC password: 9OFzADhG


## Trying to connect to remote jupyter-lab

ssh -f -N -L 47005:gl0003.arc-ts.umich.edu:5919 halechr@gl-campus-login.arc-ts.umich.edu

ssh -f -N -L 26998:gl3292.arc-ts.umich.edu:5902 halechr@gl-campus-login.arc-ts.umich.edu


Open a VNC client and connect to localhost:26998 within the client
Use the VNC password: OG0E9lEd


# Each -L option instructs ssh to forward a port on your local machine to a port on deeplearning:

# -L 2222:deeplearning:22 forwards port 2222 on the local machine to port 22 on deeplearning. 
	# After this is done, connecting to port 2222 on the local machine will be the same as connecting to port 22 on deeplearning. Port 22 is the one on which ssh servers listen so now, you can do: 
ssh -L 2222:deeplearning:22 -L 8889:deeplearning:8889 portal

great_lakes_node_name=gl0005
vnc_port=63967
ssh -f -N -L "${vnc_port}":"${great_lakes_node_name}".arc-ts.umich.edu:5902 -L 8889:"${great_lakes_node_name}".arc-ts.umich.edu:8889 halechr@gl-campus-login.arc-ts.umich.edu # Forwards port 5902 on the remote machine to port "${vnc_port}" on local
# Forwards port 8889 on remote to 8889 on local (for jupyter-lab)

ssh -f -N -L 63967:gl0005.arc-ts.umich.edu:5902 -L 8889:gl0005.arc-ts.umich.edu:8889 halechr@gl-campus-login.arc-ts.umich.edu # Forwards port 5902 on the remote machine to port 26998 on local



# On Greatlakes:
```bash
cd /home/halechr/repos/Spike3D
./scripts/repos_pull_changes.sh
poetry shell
jupyter-lab --no-browser --port=8889 --ip=0.0.0.0
```

