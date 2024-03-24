<h1 align="center">
  <b>SubDomz</b>
  <br>
</h1> 
<h3 align="center">
All in One (Passive) Subdomain Enumeration Tool
</p>
  
-----------------------------
### What is SubDomz ?
 SubDomz is an automation tool for finding the subdomains passively of the given target or targets. It uses multiple tools and various online search engines and services in parallel to find subdomains effectively and sort and save them in an organised way.


### Installation
```
git clone https://github.com/0xlittleboy/SubDomz.git
cd SubDomz 
chmod +x install.sh SubDomz.sh
./install.sh
```

### Usage
```
# Options:
      -d, --domain            - Domain to enumerate
      -l, --list              - List of root domains to enumerate
      -u, --use               - Specify which tools to be used (Ex: subfinder, amass, crt,...)
      -e, --exclude           - Specify which tools to be excluded (Ex: findomain, wayback, gau,...)
      -o, --output            - Output file to save final results ( Default: <target>-Date-Time.txt)
      -s, --silent            - Show only subdomains in output
      -hp, --http-probe       - probe for working http/https servers
      -k, --keep              - keep the temporary files ( output from each tools)
      -p, --parallel          - Run parallely for faster results. Doesn't Work With -e/--exclude or -u/--use.
      -h, --help              - Display this help message and exit
      -v, --version           - Display the version and exit
      -ls, --list-sources     - Display all available sources/tools
```

### Available Sources/tools
- [Subfinder](https://github.com/projectdiscovery/subfinder)
- [Amass](https://github.com/owasp-amass/amass)
- [Assetfinder](https://github.com/tomnomnom/assetfinder)
- [Chaos](https://github.com/projectdiscovery/chaos-client)
- [Findomain](https://github.com/Findomain/Findomain)
- [Haktrails](https://github.com/hakluke/haktrails)
- [Gau](https://github.com/lc/gau)
- [Github-subdomains](https://github.com/gwen001/github-subdomains)
- [Gitlab-subdomains](https://github.com/gwen001/gitlab-subdomains)
- [Cero](https://github.com/glebarez/cero)
- [Shosubgo](https://github.com/incogbyte/shosubgo)
- [Censys](https://search.censys.io/)
- [Crtsh](https://crt.sh/)
- [JLDC-anubis](https://jldc.me/anubis)
- [Alienvault](https://otx.alienvault.com)
- [Subdomain-center](https://api.subdomain.center)
- [Certspotter](https://api.certspotter.com)

### API keys
+ Add your API keys in [config.txt](https://github.com/0xPugazh/SubDomz/blob/master/config.txt)

### Get 200$ credits on DO
[![DigitalOcean Referral Badge](https://web-platforms.sfo2.cdn.digitaloceanspaces.com/WWW/Badge%201.svg)](https://www.digitalocean.com/?refcode=87789189e3ea&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=badge)

## Support Me
<a href="https://www.buymeacoffee.com/0xPugazh" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>

### Credit
This tool was inspired by [@bing0o](https://github.com/bing0o) [domains.sh](https://github.com/bing0o/bash_scripting/blob/master/domains.sh) script.

## Star History

<a href="https://star-history.com/#0xPugazh/SubDomz&Date">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=0xPugazh/SubDomz&type=Date&theme=dark" />
    <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=0xPugazh/SubDomz&type=Date" />
    <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=0xPugazh/SubDomz&type=Date" />
  </picture>
</a>
