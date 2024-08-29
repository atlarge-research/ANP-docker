#!/usr/bin/bash

#get the dir the script is located
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker run --sysctl net.ipv6.conf.all.disable_ipv6=1 \
    --sysctl net.ipv6.conf.default.disable_ipv6=1 \
    --sysctl net.ipv4.ip_forward=1 --sysctl net.ipv6.conf.lo.disable_ipv6=1 \
    -d -p 2222:22 --cap-add=NET_ADMIN \
    -v ${SCRIPT_DIR}/anp_netskeleton:/home/ubuntu/anp_netskeleton ubuntu-anp
