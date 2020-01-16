#!/bin/bash

# Install and set up Go:
curl -O https://storage.googleapis.com/golang/go1.13.linux-amd64.tar.gz
sha256sum go1.13.linux-amd64.tar.gz
tar -xvf go1.13.linux-amd64.tar.gz
chown -R root:root ./go
mv go /usr/local
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
source ~/.profile

# Set up your environment:
echo export GOPATH=\"\$HOME/go\" >> ~/.bash_profile
echo export PATH=\"\$PATH:\$GOPATH/bin\" >> ~/.bash_profile