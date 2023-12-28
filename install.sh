#!/bin/bash

echo -e "Installation Started..."
echo " "
mkdir -p tools


Golang() {
	printf "                                \r"
	sys=$(uname -m)
	LATEST=$(curl -s 'https://go.dev/VERSION?m=text')
	[ $sys == "x86_64" ] && wget https://golang.org/dl/$LATEST.linux-amd64.tar.gz -O golang.tar.gz  || wget https://golang.org/dl/$LATEST.linux-386.tar.gz -O golang.tar.gz 
	sudo tar -C /usr/local -xzf golang.tar.gz 
	echo "export GOROOT=/usr/local/go" >> $HOME/.bashrc
	echo "export GOPATH=$HOME/go" >> $HOME/.bashrc
	echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $HOME/.bashrc
  echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.profile

	printf "[+] Golang Installed !.\n"
}
sleep 0.5


sudo apt install python3-shodan -y 
sudo apt install python3-censys -y 
sudo apt install nmap -y 
sudo apt install jq -y 
sudo apt install git -y 
sudo apt install python3 -y 
sudo apt install python -y 
sudo apt-get -y install python3-pip 
sudo apt install -y parallel 

# Installing Tools
Subfinder() {
            printf "                                \r"
            GO111MODULE=on go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest 
            printf "[+] Subfinder Installed! \n"
}

Assetfinder() {
            printf "                                \r"
            go install -v github.com/tomnomnom/assetfinder@latest 
            printf "[+] Assetfinder Installed! \n"
}

Chaos() {
            printf "                  \r"
            go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
            printf "[+] Chaos Installed! \n"
}

Shuffledns() {
            printf "                  \r"
            go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
            printf "[+] Shuffledns Installed! \n"
}

Findomain() {
	    cd ~/SubDomz/tools
            curl -LO https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip  && unzip findomain-linux.zip 
            chmod +x findomain
            sudo mv findomain /usr/local/bin/findomain;
            printf "[+] Findomain Installed! \n"
}

Amass() {
            printf "                                \r"
	    GO111MODULE=on go install -v github.com/OWASP/Amass/v3/...@latest 
	    printf "[+] Amass Installed! \n"
}

Gau() {
            printf "                                \r"
            go install github.com/lc/gau@latest 
            printf "[+] Gau Installed! \n"
}

Waybackurls() {
            printf "                \r"
            go install github.com/tomnomnom/waybackurls@latest 
            printf "[+] Waybackurls Installed! \n"
}

Github-Subdomains() {
            printf "            \r"
            go install -v github.com/gwen001/github-subdomains@latest 
            printf "[+] Github-Subdomains Installed! \n"
}

Gitlab-Subdomains() {
            printf "          \r"
            go install github.com/gwen001/gitlab-subdomains@latest
            printf "[+] Gitlab-Subdomains Installed! \n"
}
Crobat() {
            printf "                  \r"
            go install github.com/cgboal/sonarsearch/cmd/crobat@latest 
            printf "[+] Crobat Installed! \n"
}

CTFR() {
            printf "                  \r"
	    cd ~/SubDomz/tools
            git clone https://github.com/UnaPibaGeek/ctfr.git 
            cd ctfr
            pip3 install -r requirements.txt 
            sudo cp ctfr.py /usr/local/bin
            sudo chmod +x /usr/local/bin/ctfr.py
            printf "[+] CTFR Installed! \n"
}

Cero() {
            printf "                              \r"
            go install -v github.com/glebarez/cero@latest 
            printf "[+] Cero Installed! \n"
}

Sudomy() {
            printf "                          \r"
	    cd ~/SubDomz/tools
            git clone --recursive https://github.com/screetsec/Sudomy.git 
            cd Sudomy && python3 -m pip install -r requirements.txt 
            sudo cp sudomy /usr/local/bin
            printf "[+] Sudomy Installed! \n"
}

Shodomain() {
            printf "                                    \r"
	    cd ~/SubDomz/tools
            git clone https://github.com/SmoZy92/Shodomain 
            cd Shodomain && pip install -r requirements.txt 
            sudo cp shodomain.py /usr/local/bin
            sudo chmod +x /usr/local/bin/shodomain.py
            printf "[+] Shodomain Installed! \n"
}

Censys-Subdomain-Finder() {
            printf "                  \r"
	    cd ~/SubDomz/tools
            git clone https://github.com/christophetd/censys-subdomain-finder.git 
            cd censys-subdomain-finder
            python3 -m venv venv
            source venv/bin/activate
            pip3 install -r requirements.txt 
            sudo ln -svf censys-subdomain-finder.py /usr/bin/censys-subdomain-finder.py 
            sudo chmod +x /usr/bin/censy-subdomain-finder.py 
            printf "[+] Censys-Subdomain-Finder Installed! \n"
}

Httpx() {
	         printf "                                \r"
	         go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest 
	         printf "[+] Httpx Installed! \n"
}

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
sudo cp ~/go/bin/* /usr/local/bin

hash go 2>/dev/null && printf "[!] Golang is already installed.\n" || { printf "[+] Installing Golang!" && Golang; }

#Checking Dependencies

#Checking Tools
hash findomain 2>/dev/null && printf "[!] Findomain is already installed.\n" || { printf "[+] Installing Findomain!" && Findomain; }
hash subfinder 2>/dev/null && printf "[!] Subfinder is already installed.\n" || { printf "[+] Installing subfinder!" && Subfinder; }
hash amass 2>/dev/null && printf "[!] Amass is already installed.\n" || { printf "[+] Installing Amass!" && Amass; }
hash assetfinder 2>/dev/null && printf "[!] Assetfinder is already installed.\n" || { printf "[+] Installing Assetfinder!" && Assetfinder; }
hash chaos 2>/dev/null && printf "[!] Chaos is already installed.\n" || { printf "[+] Installing Chaos!" && Chaos; }
hash shuffledns 2>/dev/null && printf "[!] Shuffledns is already installed.\n" || { printf "[+] Installing Shuffledns!" && Shuffledns; }
hash gau 2>/dev/null && printf "[!] Gau is already installed.\n" || { printf "[+] Installing Gau!" && Gau; }
hash waybackurls 2>/dev/null && printf "[!] Waybackurls is already installed.\n" || { printf "[+] Installing Waybackurls!" && Waybackurls; }
hash github-subdomains 2>/dev/null && printf "[!] Github-Subdomains is already installed.\n" || { printf "[+] Installing Github-subdomains!" && Github-Subdomains; }
hash gitlab-subdomains 2>/dev/null && printf "[!] Gitlab-Subdomains is already installed.\n" || { printf "[+] Installing Gitlab-subdomains!" && Gitlab-Subdomains; }
hash crobat 2>/dev/null && printf "[!] Crobat is already installed.\n" || { printf "[+] Installing Crobat!" && Crobat; }
hash ctfr.py 2>/dev/null && printf "[!] CTFR is already installed.\n" || { printf "[+] Installing CTFR!" && CTFR; }
hash cero 2>/dev/null && printf "[!] Cero is already installed.\n" || { printf "[+] Installing Cero!" && Cero; }
hash sudomy 2>/dev/null && printf "[!] Sudomy is already installed.\n" || { printf "[+] Installing Sudomy!" && Sudomy; }
hash shodomain.py 2>/dev/null && printf "[!] Shodomain is already installed.\n" || { printf "[+] Installing Shodomain!" && Shodomain; }
hash censys-subdomain-finder.py 2>/dev/null && printf "[!] Censys-Subdomain-Finder is already installed.\n" || { printf "[+] Installing Censys-Subdomain-Finder!" && Censys-Subdomain-Finder; }
hash httpx 2>/dev/null && printf "[!] Httpx is already installed.\n" || { printf "[+] Installing Httpx!" && Httpx; }



list=(
	  Golang
	  Subfinder
	  Assetfinder
    Chaos
	  Findomain
	  Amass
  	Gau
  	Waybackurls
  	Github-Subdomains
    Gitlab-Subdomains
  	Crobat
  	CTFR
  	Cero
  	Sudomy
  	Shodomain
  	Censys-Subdomain-Finder
  	Httpx
	)

      r="\e[31m"
      g="\e[32m"
      e="\e[0m"

for prg in ${list[@]}
do
      hash $prg 2>/dev/null && printf "[$prg]$g Done$e\n" || printf "[$prg]$r Not Installed! Check Again.$e\n"
    done
