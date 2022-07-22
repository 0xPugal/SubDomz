# SubDomz 
**All in One Subdomain Enumeration Tool** 

![image](https://user-images.githubusercontent.com/75373225/180496159-c9953403-6580-4d6b-9136-d0d78f5d8920.png)

-----------------------------
### What is SubDomz ?
 SubDomz is a automation tool for finding the Subdomains of the given target/targets. It uses multiple tools and various online search engines & services parallely to find subdomains effectively and sort it & save it in a Ordered way.
 #### Platforms Tested:
 + Debian based Linux ( Ubuntu, Kali, Parrot )
### Installation
```
git clone https://github.com/0xlittleboy/SubDomz.git
cd SubDomz.git 
chmod +x install.sh SubDomz
./install.sh
```

### Tools Included
+ Subfinder
+ Assetfinder
+ Findomain
+ Amass
+ Gauplus
+ Waybackurls 
+ Github-Subdomains
+ Crobat
+ CTFR
+ Cero
+ Sublist3r
+ Sudomy
+ Shodomain
+ Censys-Subdomain-Finder
+ Nmap

### Online Search Engines & Services
+ Archive (Wayback Machine)
+ BufferOver
+ Crtsh
+ Riddler
+ CertSpotter
+ JLDC
+ HackerTarget
+ ThreatCrowd
+ Anubis
+ ThreatMiner

### API keys
+ Add Shodan API key in line [209](https://github.com/0xlittleboy/SubDomz/blob/master/SubDomz#L209) and [213](https://github.com/0xlittleboy/SubDomz/blob/master/SubDomz#L213)
+ Add Censys API & SECRET in line [220](https://github.com/0xlittleboy/SubDomz/blob/master/SubDomz#L220) and [224](https://github.com/0xlittleboy/SubDomz/blob/master/SubDomz#L224)
+ Add Github Token in line [143](https://github.com/0xlittleboy/SubDomz/blob/master/SubDomz#L143) and [147](https://github.com/0xlittleboy/SubDomz/blob/master/SubDomz#L147)
+ Use Subfinder and Amass with Config file(with API keys) for more Subdomains (If you want, you can edit the Subfinder config file path with ``-pc`` flag in line [66](https://github.com/0xlittleboy/SubDomz/blob/master/SubDomz#L66) and [70](https://github.com/0xlittleboy/SubDomz/blob/master/SubDomz#L70) and Amass config file with ``-config`` flag in line [99](https://github.com/0xlittleboy/SubDomz/blob/master/SubDomz#L99) and [103](https://github.com/0xlittleboy/SubDomz/blob/master/SubDomz#L103)

### Credit
This tool was inspired by [@bing0o](https://github.com/bing0o) [domains.sh](https://github.com/bing0o/bash_scripting/blob/master/domains.sh) script. Thanks to him for the great idea!

<h3 align="left">Support:</h3>
<p><a href="https://www.buymeacoffee.com/litt1eb0y"> <img align="left" src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" width="210" alt="litt1eb0y" /></a></p><br> <br>
<br><p><a href="https://www.paypal.com/paypalme/litt1eb0y"> <img align="left" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" /></a></p><br>
