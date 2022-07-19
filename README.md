# SubDomz 

**The All in One Subdomain Enumeration Tool** 
![carbon](https://user-images.githubusercontent.com/75373225/179715470-f91bcfd5-1c59-4da6-927a-a0b02eef2920.png)

#### The tool SubDomz uses multiple open-source tools and various OSINT search engines to find subdomains effectively.
-----------------------------

## Usage
```
git clone https://github.com/0xlittleboy/subdomz
cd subdomz
sudo bash install.sh
bash subdomz.sh -h
```
## API keys
***Add your API keys in Subfinder and Amass configuration file***
+ ***[subfinder.yaml](https://github.com/0xlittleboy/subdomz/blob/master/subfinder.yaml)***
+ ***[amass.ini](https://github.com/0xlittleboy/subdomz/blob/master/amass.ini)***
---
***Add your Shodan API Key in line 218 and line 222***
```
shodomain <API-KEY> $domain 

    shodomain <API-KEY> $domain 
  ```
  ***Add your Censys API ID and Secret key in line 230 and line 234***
  ```
    censys-subdomain-finder.py --censys-api-id <CENSYS_API_ID> --censys-api-secret <CENSYS_API_SECRET> $domain 

    censys-subdomain-finder.py --censys-api-id <CENSYS_API_ID> --censys-api-secret <CENSYS_API_SECRET> $domain 
```
***Add your Github Access Token in line 146 and line 150***
```
github-subdomains -d $domain -t <TOKEN>
github-subdomains -d $domain -t <TOKEN>
```

![image](https://user-images.githubusercontent.com/75373225/179716552-4d7bb181-2077-4a37-8edc-66532e78e9b0.png)

## Credit
***This tool was inspired by @bing0o [SubEnum](https://github.com/bing0o/bash_scripting/blob/master/domains.sh) script. Thanks to them for the great idea!***
--------------
***This is under developement***

-------------
<h3 align="left">Support:</h3>
<p><a href="https://www.buymeacoffee.com/litt1eb0y"> <img align="left" src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" height="50" width="210" alt="litt1eb0y" /></a></p><br> <br>
<br><p><a href="https://www.paypal.com/paypalme/litt1eb0y"> <img align="left" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" /></a></p><br>
