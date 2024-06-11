#!/bin/bash

# Installing tools
sudo apt-get install -y parallel jq python3 python3-pip unzip

pip3 install --break-system-packages shodan censys

# Install tools using Go
GO111MODULE=on go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
GO111MODULE=on go install -v github.com/owasp-amass/amass/v3/...@master
GO111MODULE=on go install github.com/tomnomnom/assetfinder@latest
GO111MODULE=on go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
GO111MODULE=on go install -v github.com/hakluke/haktrails@latest
GO111MODULE=on go install github.com/lc/gau/v2/cmd/gau@latest
GO111MODULE=on go install github.com/gwen001/github-subdomains@latest
GO111MODULE=on go install github.com/gwen001/gitlab-subdomains@latest
GO111MODULE=on go install -v github.com/glebarez/cero@latest
GO111MODULE=on go install github.com/incogbyte/shosubgo@latest
GO111MODULE=on go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
GO111MODULE=on go install -v github.com/tomnomnom/anew@latest
GO111MODULE=on go install github.com/tomnomnom/unfurl@latest
git clone https://github.com/blechschmidt/massdns.git && cd massdns && make && sudo make install
GO111MODULE=on go install github.com/d3mondev/puredns/v2@latest
GO111MODULE=on go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest

# Downloading Resolvers
git clone https://github.com/trickest/resolvers

# Downloading wordlist
wget -O best-dns-wordlist.txt https://wordlists-cdn.assetnote.io/data/manual/best-dns-wordlist.txt

# Downloading .gau.toml for gau
wget https://raw.githubusercontent.com/lc/gau/master/.gau.toml

# Installing findomain
wget https://github.com/Findomain/Findomain/releases/download/8.2.1/findomain-linux.zip && unzip findomain-linux.zip && rm findomain-linux.zip && chmod +x findomain && sudo mv findomain /usr/bin/
