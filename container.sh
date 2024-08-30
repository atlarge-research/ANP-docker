#!/bin/bash
# special thanks to vusec Compiler Construction repository for inspiration!
# https://bitbucket.org/vusec/vu-coco-public/

# invoke this script like ./container.sh -t to build locally or ./container.sh
# to pull the image from web.


#make sure errors stop the script
set -e
set -o pipefail

# make sure were not in the VM
if test -f "/home/ubuntu/anp_netskeleton"; then
    echo -e "${INFO} You may be on the ANP vm, "
    echo -e "      use docker. You can run all commands in this shell."
    exit
fi

# Sanity check if docker is installed.
if ! command -v docker &> /dev/null
then
    echo -e "${ERROR} Docker does not seem to be installed."
    echo "      Follow one of the install guides here:"
    echo "      https://docs.docker.com/get-docker/"
    exit
fi
echo -e "OK:Found docker"

export DOCKER_USER=atlarge-research

echo -e "Building docker image"
docker build -t ubuntu-anp .
echo -e "OK: Docker finished building"
echo -e "try running chmod +x ./start.sh && ./start.sh"

