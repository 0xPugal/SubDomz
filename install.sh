#!/bin/bash
# Installation script
cat <<"EOF"
            _         _
  ___ _   _| |__   __| | ___  _ __ ___  ____
 / __| | | | '_ \ / _` |/ _ \| '_ ` _ \|_  /
 \__ \ |_| | |_) | (_| | (_) | | | | | |/ /
 |___/\__,_|_.__/ \__,_|\___/|_| |_| |_/___|
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@  The All in One Subdomain Enumeration Tool  @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

***********************************************
*           Installation Started              *
***********************************************
EOF
sleep 0.5
echo " "
Packages() {
              printf "                        \r"
              printf "[+] Installing Packages...\n"
              printf "            \r"
              printf "[+] Updating... \n"
              sudo apt update &>/dev/null
              sudo apt install git &>/dev/null
              sudo apt install python3 &>/dev/null
              printf "[+] Installing Dependencies... \n"
              sudo apt -y install python3-pip &>/dev/null
              sudo apt-get install jq &>/dev/null
              sudo pip3 install requests &>/dev/null
              sudo pip3 install dnspython &>/dev/null
              printf "[+] Installing Dependencies... \n"
              sudo pip3 install argparse &>/dev/null
              sudo apt install python2 &>/dev/null
              sudo apt-get install parallel -y &>/dev/null
              printf "[+] Installing Dependencies... \n"
              sudo apt-get install nmap &>/dev/null
              sudo apt install phantomjs &>/dev/null
              sudo apt install npm &>/dev/null
              printf "[+] Installing Dependencies... \n"
              sudo apt install chromium &>/dev/null
              npm i -g wappalyzer wscat &>/dev/null
              sudo apt install shodan &>/dev/null
              printf "[+] Installing Dependencies... \n"
              sudo apt install censys &>/dev/null

              printf "[+] Packages Installed! \n"
}
sleep 0.5

Golang() {
            printf "                        \r"
            sys=$(uname -m)
            LATEST=$(curl -s 'https://go.dev/VERSION?m=text')
            [ $sys == "x86_64" ] && wget https://dl.google.com/go/$LATEST.linux-amd64.tar.gz &>/dev/null || wget https://dl.google.com/go/$LATEST.linux-amd64.tar.gz &>/dev/null
	          sudo tar -C /usr/local -xzf $LATEST.linux-amd64.tar.gz
	          echo "export GOROOT=/usr/local/go" >> $HOME/.bashrc
	          echo "export GOPATH=$HOME/go" >> $HOME/.bashrc
	          echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $HOME/.bashrc

            printf "[+] Golang Installed! \n"
}
sleep 0.5

echo "Installing Tools..."
Subfinder() {
            printf "                                \r"
            GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder &>/dev/null
            printf "[+] Subfinder Installed! \n"
}

Assetfinder() {
            printf "                                \r"
            go install -v github.com/tomnomnom/assetfinder@latest &>/dev/null
            printf "[+] Assetfinder Installed! \n"
}

Findomain() {
            wget https://github.com/Edu4rdSHL/findomain/releases/latest/download/findomain-linux &>/dev/null
            chmod +x findomain-linux
            ./findomain-linux -h &>/dev/null &&
            sudo mv findomain-linux /usr/local/bin/findomain;
            printf "[+] Findomain Installed! \n"
}

Amass() {
            printf "                                \r"
	          GO111MODULE=on go get -v github.com/OWASP/Amass/v3/... &>/dev/null
	          printf "[+] Amass Installed! \n"
}

Gauplus() {
            printf "                                \r"
            go install github.com/bp0lr/gauplus@latest &>/dev/null
            printf "[+] Gauplus Installed! \n"
}

Waybackurls() {
            printf "                \r"
            go install github.com/tomnomnom/waybackurls@latest &>/dev/null
            printf "[+] Waybackurls Installed! \n"
}

Github-Subdomains() {
            printf "            \r"
            go install -v github.com/gwen001/github-subdomains@latest &>/dev/null
            printf "[+] Github-Subdomains Installed! \n"
}

crobat() {
            printf "                  \r"
            go install github.com/cgboal/sonarsearch/cmd/crobat@latest &>/dev/null
            printf "[+] crobat Installed! \n"
}

CTFR() {
            printf "                  \r"
            git clone https://github.com/UnaPibaGeek/ctfr.git &>/dev/null
            cd ctfr/
            pip3 install -r requirements.txt &>/dev/null
            sudo ln -svf ctfr.py /usr/bin/ctfr &>/dev/null
            sudo chmod +x /usr/bin/ctfr &>/dev/null
            printf "[+] CTFR Installed! \n"
}

Cero() {
            printf "                              \r"
            go install -v github.com/glebarez/cero@latest &>/dev/null
            printf "[+] Cero Installed! \n"
}

Sublister() {
            printf "                    \r"
            git clone https://github.com/aboul3la/Sublist3r.git &>/dev/null
            cd Sublist3r
            pip3 install -r requirements.txt &>/dev/null
            sudo ln -svf sublist3r.py /usr/bin/sublist3r &>/dev/null
            printf "[+] Sublister Installed! \n"
}

Sudomy() {
            printf "                          \r"
            git clone --recursive https://github.com/screetsec/Sudomy.git &>/dev/null
            cd Sudomy && python3 -m pip install -r requirements.txt &>/dev/null
            sudo cp sudomy /usr/local/bin
            printf "[+] Sudomy Installed! \n"
}

Shodomain() {
            printf "                                    \r"
            git clone https://github.com/SmoZy92/Shodomain &>/dev/null
            cd Shodomain && pip install -r requirements.txt &>/dev/null
            sudo ln -svf shodomain.py /usr/bin/shodomain &>/dev/null
            sudo chmod +x /usr/bin/shodomain &>/dev/null
            printf "[+] Shodomain! \n"
}

Censys-Subdomain-Finder() {
            printf "                  \r"
            git clone https://github.com/christophetd/censys-subdomain-finder.git
            cd censys-subdomain-finder
            python3 -m venv venv
            source venv/bin/activate
            pip3 install -r requirements.txt
            sudo ln -svf censys-subdomain-finder.py /usr/bin/censys-subdomain-finder.py &>/dev/null
            sudo chmod +x /usr/bin/censy-subdomain-finder.py &>/dev/null
            printf "[+] Censys-Subdomain-Finder Installed! \n"
}

Httprobe() {
	         printf "                                \r"
	         go install -v github.com/tomnomnom/httprobe@latest &>/dev/null
	         printf "[+] Httprobe Installed !.\n"
}


sleep 0.5


export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
sudo cp ~/go/bin/* /usr/local/bin


list=(
  Packages
	Golang
	Subfinder
	Assetfinder
	Findomain
	Amass
  Gauplus
  Waybackurls
  Github-Subdomains
  Crobat
  CTFR
  Cero
  Sublister
  Sudomy
  Shodomain
  Censys-Subdomain-Finder
  Httprobe
	)

      r="\e[31m"
      g="\e[32m"
      e="\e[0m"

for prg in ${list[@]}
do
      hash $prg 2>/dev/null && printf "[$prg]$g Done$e\n" || printf "[$prg]$r Not Installed! Check Again.$e\n"
    done
