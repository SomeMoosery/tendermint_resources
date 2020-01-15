# Cosmos / Tendermint Resources

## Getting everything up and running

Since we need to be working on Ubuntu 16.04, this means we should run (for the time being) an EC2 instance running Ubuntu 16.04. This falls within the free tier, so that's a nice perk.

### Getting Connected
1. Spin up your EC2 instance, download the new key if you need to
2. Navigate to that new key, run `chmod 400 <filename>.pem` to make it private
3. run `ssh -i <path/to/privatekey.pem> <username>@<ec2-public-dns>` in iTerm to SSH into your EC2 instance
4. run `sudo su` to enter superuser mode (this may not be necessary longterm but whatever for now) 

### Install Go and Set Up Environment [(sauce)](https://www.linode.com/docs/development/go/install-go-on-ubuntu/)

Install and set up Go:
1. `curl -O https://storage.googleapis.com/golang/go1.13.linux-amd64.tar.gz` - you need to use Go v1.13
2. `sha256sum go1.13.linux-amd64.tar.gz` - this just verifies the `.tar` file
3. `tar -xvf go1.12.9.linux-amd64.tar.gz`
4. `chown -R root:root ./go` - run with sudo if not superuser
5. `mv go /usr/local` - run with sudo if not superuser
6. `export GOPATH=$HOME/go`
7. `export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin`
8. `source ~/.profile`

Set up your environment:
1. `echo export GOPATH=\"\$HOME/go\" >> ~/.bash_profile`
2. `echo export PATH=\"\$PATH:\$GOPATH/bin\" >> ~/.bash_profile`
3. `echo export GO111MODULE=on >> ~/.bash_profile`
4. `source ~/.bash_profile`

### Installing Tendermint [(sauce)](https://github.com/tendermint/tendermint/blob/master/docs/introduction/install.md)

1. `mkdir -p $GOPATH/src/github.com/tendermint`
2. `cd $GOPATH/src/github.com/tendermint`
3. `git clone https://github.com/tendermint/tendermint.git`
4. `cd tendermint`
5. `make tools`
6. `make install`
7. `make build`

Test by running `tendermint version` 

### Installing ABCLI for First App [(sauce)](https://github.com/tendermint/tendermint/blob/master/docs/app-dev/getting-started.md)

1. `go get github.com/tendermint/tendermint`
2. `cd $GOPATH/src/github.com/tendermint/tendermint`
3. `make tools`
4. `make install_abci`
