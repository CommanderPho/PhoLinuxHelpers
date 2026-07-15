# PhoLinuxHelpers

Includes various helpers and utilities for linux and also my notes about using linux collected over 2023

## Great Lakes Mirror Data from Turbo to Scratch
```bash

mirror_turbo_data_to_scratch DANDI/SingleDayWTrackLearning/000978 --dry-run

mirror_turbo_data_to_scratch KDIBA/gor01/one --dry-run


# /media/halechr/BETAMAX1/Data/DANDI/SingleDayWTrackLearning/000978/

```

## Great Lakes OnDemand native VNC

Source the helpers (e.g. from [sources/remote_connections_aliases.sh](sources/remote_connections_aliases.sh)), then use the OnDemand VNC tunnel helper. From your session’s “Instructions to connect using native VNC” you can either paste the SSH command (and optionally the VNC password) or pass local port and node name:

```bash
# Paste the SSH command from OnDemand; optionally pass VNC password as second arg
ondemand_vnc_tunnel 'ssh -f -N -L 24104:gl3467.arc-ts.umich.edu:5901 halechr@greatlakes.arc-ts.umich.edu' 'xgMl0NjD'

# Or pass local port and node name (optional third arg: password to display for copy/paste)
ondemand_vnc_tunnel 24104 gl3467 'xgMl0NjD'
```

The helper establishes the SSH tunnel and launches a VNC client to `localhost:<port>`. You must still enter the VNC password in the client when prompted (the optional password arg is only echoed for copy/paste).

### Obtaining the password and connection details

When the OnDemand web UI isn’t available, use interactive SSH/SFTP to connect to:

- **Host:** `greatlakes-oncampus.arc-ts.umich.edu`
- **Path:** `/home/halechr/ondemand/data/sys/dashboard/batch_connect/sys/bc_desktop_basic/output/<session-id>/`

Copy the session’s `connection.yml`; it contains the VNC host, port, and password, for example:

```yaml
host: gl3467.arc-ts.umich.edu
port: 5901
password: xgMl0NjD
display: 1
websocket: 19327
spassword: 4QSintAL
```

Use `host`, `port`, and `password` with the helper (choose any free local port for the tunnel).


https://greatlakes-oncampus.arc-ts.umich.edu/pun/sys/dashboard/files/fs//home/halechr/ondemand/data/sys/dashboard/batch_connect/sys/bc_desktop_basic/output/9f41ed21-386c-45c2-844e-f1df1852d0ce/connection.yml


https://greatlakes-oncampus.arc-ts.umich.edu/pun/sys/dashboard/files/fs/home/halechr/ondemand/data/sys/dashboard/batch_connect/sys/bc_desktop_basic/output/9f41ed21-386c-45c2-844e-f1df1852d0ce/connection.yml
https://greatlakes-oncampus.arc-ts.umich.edu/pun/sys/dashboard/files/fs//home/halechr/ondemand/data/sys/dashboard/batch_connect/sys/bc_desktop_basic/output/9f41ed21-386c-45c2-844e-f1df1852d0ce/connection.yml
