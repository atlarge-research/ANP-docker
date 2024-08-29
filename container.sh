#!/usr/bin/env bash
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

#perhaps in the future we can look into publishing a docker image

#if [ "$1" == "--build" ] || [ "$1" == "-t" ]; then
    
#fi

# else
#     echo -en "${INFO} Downloading docker image (This might take a while): "
#     set +e
#     docker pull --quiet ${DOCKER_USER}/anp
#     if [ $? -eq 0 ]
#     then
#         echo -e "OK: Downloaded docker image"
#     else
#         echo -e "Failed to download docker image."
#         echo -e "Check if you are connected to the internet."
#         echo -e "If you are, try rerunning script like this: '${0} --build'."
#         exit 1
#     fi
#     set -e
# fi