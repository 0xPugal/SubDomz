#!/bin/bash
#
Parallel(){
    printf "                                \r"
        sudo apt-get install parallel -y
}

JQ() {
    printf "                                \r"
        sudo apt-get install jq -y
}

Python() {
    printf "                                \r"
        sudo apt-get install python3 -y
}

Pip() {
    printf "                                \r"
        sudo apt-get install python3-pip -y
}

Shodan() {
    printf "                                \r"
    pip3 install shodan || pip3 install shodan --break-system-packages
}

Censys() {
    printf "                                \r"
    pip3 install censys || pip3 install censys --break-system-packages
}

Subfinder() {
        printf "                                \r"
        go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
}

Amass() {
        printf "                                \r"
        go install -v github.com/owasp-amass/amass/v3/...@master
}

Assetfinder() {
        printf "                                \r"
        go install github.com/tomnomnom/assetfinder@latest
}

Chaos() {
        printf "                                \r"
        go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
}

Findomain() {
        printf "                                \r"
        wget https://github.com/Findomain/Findomain/releases/download/8.2.1/findomain-linux.zip
        unzip findomain-linux.zip
        rm findomain-linux.zip
        chmod +x findomain
        sudo mv findomain /usr/bin/
}

Haktrails() {
        printf "                                \r"
        go install -v github.com/hakluke/haktrails@latest
}

Gau() {
        printf "                                \r"
        go install github.com/lc/gau/v2/cmd/gau@latest
        wget ~/ https://raw.githubusercontent.com/lc/gau/master/.gau.toml
}

Github-subdomains() {
        printf "                                \r"
        go install github.com/gwen001/github-subdomains@latest
}

Gitlab-subdomains() {
        printf "                                \r"
        go install github.com/gwen001/gitlab-subdomains@latest
}

Cero() {
        printf "                                \r"
        go install -v github.com/glebarez/cero@latest
}

Shosubgo() {
        printf "                                \r"
        go install github.com/incogbyte/shosubgo@latest
}

Httpx() {
        printf "                                \r"
        go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
}

Anew() {
        printf "                                \r"
        go install -v github.com/tomnomnom/anew@latest
}

Unfurl() {
        printf "                                \r"
        go install github.com/tomnomnom/unfurl@latest
}

Parallel
JQ
Python
Pip
Shodan
Censys
Subfinder
Amass
Assetfinder
Chaos
Findomain
Haktrails
Gau
Github-subdomains
Gitlab-subdomains
Cero
Shosubgo
Httpx
Anew
Unfurl

list=(
        parallel
        jq
        python3
        pip
        shodan
        censys
        subfinder
        amass
    assetfinder
    chaos
    findomain
    haktrails
    gau
    github-subdomains
    gitlab-subdomains
    cero
    shosubgo
    httpx
    anew
    unfurl
        )

r="\e[31m"
g="\e[32m"
e="\e[0m"

for prg in ${list[@]}
do
        hash $prg 2>/dev/null && printf "[$prg]$g Installed$e\n" || printf "[$prg]$r Install Manually.$e\n"
done
