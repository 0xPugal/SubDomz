<h1 align="center">
  <b>Subdomz</b>
  <br>
</h1> 

<h3 align="center"> 
  
  [![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/) [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/0xPugal/KNOXSSer/graphs/commit-activity) [![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/) [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) [![Latest release](https://badgen.net/github/release/0xPugal/SubDomz?sort=semver&label=version)](https://github.com/0xPugal/SubDOmz/releases) [![Open Source Love svg1](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/SubDomz/KNOXSSer)
<h3 align="center">
An Automated Subdomain Enumeration Tool
</p>

  ![SubDomz](https://github.com/0xPugal/SubDomz/blob/master/SubDomz.png)

-----------------------------
### What is SubDomz?
 SubDomz is an automation tool for finding the subdomains of the given target or targets passively. It uses multiple tools and various online search engines and services in parallel to find subdomains effectively and sort and save them in an organized way.


### Installation
```
git clone https://github.com/0xPugal/Subdomz.git
cd SubDomz 
chmod +x install.sh subdomz.sh check.sh
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
      -k, --keep              - keep the temporary files ( output from each tool)
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
- [Puredns](https://github.com/d3mondev/puredns)
- [Trickest Resolvers](https://github.com/trickest/resolvers)
- [Best-DNS-wordlists](https://wordlists.assetnote.io/)

### API keys
+ Add your API keys in [config.txt](https://github.com/0xPugal/subdomz/blob/master/config.txt)

### Credit
This tool was inspired by [@bing0o](https://github.com/bing0o) [domains.sh](https://github.com/bing0o/bash_scripting/blob/master/domains.sh) script.

## Star History

<a href="https://star-history.com/#0xpugal/SubDomz&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=0xpugal/SubDomz&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=0xpugal/SubDomz&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=0xpugal/SubDomz&type=Date" />
 </picture>
</a>
