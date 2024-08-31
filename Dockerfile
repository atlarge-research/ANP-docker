FROM ubuntu:20.04

RUN apt update && apt install openssh-server sudo -y

# Install required tools from handbook
RUN apt update && apt install git gdb rsync iproute2 build-essential cmake libcap-dev arping net-tools tcpdump ethtool iptables nano vim-tiny sudo -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 dev 

RUN  echo 'dev:dev' | chpasswd

RUN service ssh start

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]
