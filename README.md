# ANP-docker
The docker setup for Advanced network programming made with help from 
Job Paardekooper

# Setup

## Clone this repository
```bash
git clone https://github.com/atlarge-research/ANP-docker.git
```

## Get your copy of the ANP-netskeleton 
Unzip your anp-2024-netskeleton into anp-netskeleton **THE NAME MATTERS**
```bash
unzip anp-2024-skeleton-main.zip -d anp_netskeleton
```

## Build or pull the docker image
```bash
chmod +x ./container.sh && ./container.sh
```

## Start the docker container

```bash
chmod +x ./start.sh && ./start.sh
```

## Connect over SSH or Vscode
### SSH
Password:
`dev`
```bash
ssh -p 2222 dev@localhost
```
### Vscode
* In vscode, go to the extentions tab, and look for `Docker` from `Microsoft` and
    install it.
* Then go to the bottom-left corner of vscode, and click the >/< symbols, and 
    Attach to running container. You should see your container here, if not, you
    may be (accidentally) doing something odd with docker contexts. 


## Fix Shell scripts
**YOU ARE NOT YET DONE**
Due to the docker setup, some scripts need fixing. When in the container, 
navigate to /home/ubuntu/anp_netskeleton/bin/
```bash
cd /home/ubuntu/anp_netskeleton/bin/
```

### `sh-make-tun-dev.sh`
Now, use your favorite text editor to edit the 
`anp_netskeleton/bin/sh-make-tun-dev.sh` file. If you have just a terminal, we
advise you to use nano
```bash
nano sh-make-tun-dev.sh
```

```bash
#!/bin/bash
set -ex 
sudo mkdir -p /dev/net
sudo mknod /dev/net/tap c 10 200
sudo chmod 0666 /dev/net/tap
```

## Setup the TUN/TAP device
```bash
sudo ./bin/sh-make-tun-dev.sh
```

## Setup NATing between the TUN/TAP device and virtual machine - use the NIC which connects to the host via NAT
```bash
sudo ./bin/sh-setup-fwd.sh eth0
```

## End
Now you can follow the regular build instructions from the handbook PDF.