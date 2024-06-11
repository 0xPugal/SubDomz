#!/bin/bash
# Installing tools
sudo apt-get install parallel -y
sudo apt-get install jq -y
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y
pip3 install shodan --break-system-packages
pip3 install censys --break-system-packages
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/owasp-amass/amass/v3/...@master
go install github.com/tomnomnom/assetfinder@latest
go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
wget https://github.com/Findomain/Findomain/releases/download/8.2.1/findomain-linux.zip && unzip findomain-linux.zip && rm findomain-linux.zip && chmod +x findomain && sudo mv findomain /usr/bin/
go install -v github.com/hakluke/haktrails@latest
go install github.com/lc/gau/v2/cmd/gau@latest && wget ~/ https://raw.githubusercontent.com/lc/gau/master/.gau.toml
go install github.com/gwen001/github-subdomains@latest
go install github.com/gwen001/gitlab-subdomains@latest
go install -v github.com/glebarez/cero@latest
go install github.com/incogbyte/shosubgo@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/tomnomnom/anew@latest
go install github.com/tomnomnom/unfurl@latest
git clone https://github.com/blechschmidt/massdns.git && cd massdns && make && sudo make install
go install github.com/d3mondev/puredns/v2@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
git clone https://github.com/trickest/resolvers
wget https://wordlists-cdn.assetnote.io/data/manual/best-dns-wordlist.txt