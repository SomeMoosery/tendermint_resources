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
echo export GO111MODULE=on >> ~/.bash_profile
source ~/.bash_profile

# Install Tendermint
mkdir -p $GOPATH/src/github.com/tendermint
cd $GOPATH/src/github.com/tendermint
git clone https://github.com/tendermint/tendermint.git
cd tendermint
apt install make
make tools
make install
make build
tendermint version

# Install ABCI
go get github.com/tendermint/tendermint
cd $GOPATH/src/github.com/tendermint/tendermint
make tools
make install_abci