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

#SubDomain Enumeration Started 
echo "----------------------------------------"
echo "SubDomain Enumeration started against $1"
echo "----------------------------------------"
sleep 1

#Assetfinder
assetfinder --subs-only $1 | tee -a $1-assetfinder.txt

#Findomain
findomain-linux -t $1 --quiet | tee -a $1-findomain.txt

#SubFinder
subfinder -d $1 -silent -o $1-subfinder.txt

#Amass
amass enum -passive -d $1 -config ~/.config/amass/config.ini -o $1-amass.txt

#Sublist3r
sublist3r -d $1 --quiet -o $1-sublist3r.txt

#Censys-Subdomain_finder
censys-subdomain-finder.py $1 -o $1-censys.txt

#BufferOver.run
curl -s https://dns.bufferover.run/dns?q=.$1.com | jq -r .FDNS_A[] | cut -d',' -f2 | sort -u | tee $1-bufferover.txt

#Riddler.io
curl -s "https://riddler.io/search/exportcsv?q=pld:target.com" | grep -Po "(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u | tee $1-riddler.txt

#CertSpotter
curl -s "https://certspotter.com/api/v1/issuances?domain=$1&include_subdomains=true&expand=dns_names" | jq .[].dns_names | grep -Po "(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u | tee -a $1-certspotter.txt

#Archive
curl -s "http://web.archive.org/cdx/search/cdx?url=*.$1/*&output=text&fl=original&collapse=urlkey" | sed -e 's_https*://__' -e "s/\/.*//" | sort -u | tee -a $1-archive.txt

#JLDC
curl -s "https://jldc.me/anubis/subdomains/$1" | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u | tee -a $1-jldc.txt

#crt.sh
curl -s "https://crt.sh/?q=%25.$1&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | tee -a $1-crtsh.txt

#Removing Duplicates
#Sorting
sleep 1
echo ""
echo "----------------------"
echo "Sorting the Subdomains"
echo "----------------------"
echo ""
cat $1-assetfinder.txt $1-amass.txt $1-findomain.txt $1-sublist3r.txt $1-subfinder.txt $1-bufferover.txt $1-riddler.txt $1-certspotter.txt $1-archive.txt $1-jldc.txt $1-crtsh.txt $1-censys.txt | sort -u | tee -a $1-subs.txt
sleep 1
rm $1-assetfinder.txt $1-amass.txt $1-findomain.txt $1-sublist3r.txt $1-subfinder.txt $1-bufferover.txt $1-riddler.txt $1-certspotter.txt $1-archive.txt $1-jldc.txt $1-crtsh.txt $1-censys.txt

#Checking Alive Domains
sleep 1
echo ""
echo "--------------------------"
echo "Checking Alive Subs for $1"
echo "--------------------------"
echo ""
httpx -l $1-subs.txt -p 80,443 -o $1-alive.txt

sleep 1
echo ""
echo "----------------------------------"
echo "Subdomain enumeration has finished"
echo "----------------------------------"
