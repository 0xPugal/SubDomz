#+/bin/bash

mkdir tools

echo -e "Installation Started..."
echo " "
sudo apt install jq -y 
sudo apt install python3 -y 
sudo apt-get -y install python3-pip 
sudo apt install -y parallel 
pip3 install censys
pip3 install shodan

GO111MODULE=on go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest 
go install -v github.com/tomnomnom/assetfinder@latest 
go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest
GO111MODULE=on go install -v github.com/OWASP/Amass/v3/...@latest 
go install github.com/lc/gau@latest 
go install -v github.com/gwen001/github-subdomains@latest 
go install github.com/gwen001/gitlab-subdomains@latest
go install github.com/cgboal/sonarsearch/cmd/crobat@latest 
go install -v github.com/glebarez/cero@latest 
go install github.com/incogbyte/shosubgo@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux.zip  && unzip findomain-linux.zip 
chmod +x findomain
sudo mv findomain /usr/local/bin/findomain;

echo ""

#Checking Tools
hash findomain 2>/dev/null && printf "[+] Findomain - Installed\n" || printf "[-] Findomain - Not installed\n" 
hash subfinder 2>/dev/null && printf "[+] Subfinder - Installed.\n" ||printf "[-] Subfinder - Not installed\n" 
hash amass 2>/dev/null && printf "[+] Amass - Installed.\n" || printf "[-] Amass - Not installed\n" 
hash assetfinder 2>/dev/null && printf "[+] Assetfinder - Installed.\n" || printf "[-] Assetfinder - Not installed\n" 
hash chaos 2>/dev/null && printf "[+] Chaos - Installed.\n" || printf "[-] Chaos - Not installed\n" 
hash gau 2>/dev/null && printf "[+] Gau - Installed.\n" || printf "[-] Gau - Not installed\n" 
hash waybackurls 2>/dev/null && printf "[+] Waybackurls - Installed.\n" || printf "[-] Waybackurls - Not installed\n" 
hash github-subdomains 2>/dev/null && printf "[+] Github-Subdomains - Installed.\n" || printf "[-] Github-Subdomains - Not installed\n" 
hash gitlab-subdomains 2>/dev/null && printf "[+] Gitlab-Subdomains - Installed.\n" || printf "[-] Gitlab-Subdomains - Not installed\n" 
hash crobat 2>/dev/null && printf "[+] Crobat - Installed.\n" || printf "[-] Crobat - Not installed\n" 
hash cero 2>/dev/null && printf "[+] Cero - Installed.\n" || printf "[-] Cero - Not installed\n" 
hash shosubgo 2>/dev/null && printf "[+] Shosubgo - Installed.\n" || printf "[-] Shosubgo - Not installed\n" 
hash censys 2>/dev/null && printf "[+] censys - Installed.\n" || printf "[-] censys - Not installed\n" 

echo """
+ Manually add the censys api key and secret key manually using 'censys config'
+ Add the API keys and tokens in Config.txt file
+ Feed the API keys and tokens in subfinder and amass config file for more subdomains
"""