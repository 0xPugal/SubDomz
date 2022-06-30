#!/bin/bash
sleep 1
cat <<"EOF"
               __        __
   _______  __/ /_  ____/ /___  ____ ___  ____
  / ___/ / / / __ \/ __  / __ \/ __ `__ \/_  /
 (__  ) /_/ / /_/ / /_/ / /_/ / / / / / / / /_
/____/\__,_/_.___/\__,_/\____/_/ /_/ /_/ /___/

⚡⚡️⚡️⚡ Made with ❤️ by litt1eb0y ⚡⚡⚡⚡
⚡️⚡⚡⚡ 🐦 twitter.com/0xlittleboy ⚡️⚡⚡⚡
EOF

echo ""
echo ""
sleep 1
echo "--------------------"
echo "Installation Started"
echo "--------------------"
echo ""
sleep 1

#Installing Packages
sudo apt update
sudo apt install git
sudo apt install python3
sudo apt -y install python3-pip
sudo apt-get install jq
sudo pip3 install requests
sudo pip3 install dnspython
sudo pip3 install argparse
sudo apt install python2
sleep 1
wget https://go.dev/dl/go1.18.3.linux-amd64.tar.gz
sudo tar -xvf go1.18.3.linux-amd64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go'	>> ~/.bashrc			
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
echo ""

#Installing Assetfinder
echo "----------------------"
echo "Installing Assetfinder"
echo "----------------------"
go get -u github.com/tomnomnom/assetfinder
sudo cp ~/go/bin/assetfinder /usr/local/bin

#Installing Amass
echo "----------------"
echo "Installing Amass"
echo "----------------"
go install -v github.com/OWASP/Amass/v3/...@master
sudo cp ~/go/bin/amass /usr/local/bin

#Installing Subfinder
echo "--------------------"
echo "Installing Subfinder"
echo "--------------------"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sudo cp ~/go/bin/subfinder /usr/local/bin

#Installing Findomain
echo "--------------------"
echo "Installing Findomain"
echo "--------------------"
wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux
chmod +x findomain-linux
sudo cp findomain-linux /usr/local/bin

#Installing Sublist3r
echo "--------------------"
echo "Installing Sublist3r"
echo "--------------------"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip3 install -r requirements.txt
sudo mv sublist3r.py /usr/local/bin

#Installing Censys-subdomain-finder
echo "-----------------------------"
echo "Installing Censys-subs-finder"
echo "-----------------------------"
git clone https://github.com/christophetd/censys-subdomain-finder.git
cd censys-subdomain-finder
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt
sudo mv censys-subdomain-finder.py /usr/local/bin

echo ""
sleep 1
echo ""
echo "-_-_-_-_-_-_-_-_-_-_-"
echo "Installation Finished"
echo "_-_-_-_-_-_-_-_-_-_-_"
