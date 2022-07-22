#!/bin/bash
#
# A small Bash script for subdomain enumeration using various tools and online services
#
# This script is originally made by @itsbing0o and I made a changes to work more effectively
sleep 1
cat<<"EOF"
               __        __
   _______  __/ /_  ____/ /___  ____ ___  ____
  / ___/ / / / __ \/ __  / __ \/ __ `__ \/_  /
 (__  ) /_/ / /_/ / /_/ / /_/ / / / / / / / /_
/____/\__,_/_.___/\__,_/\____/_/ /_/ /_/ /___/

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@   All in One Subdomain Enumeration Tool    @
@--------------------------------------------@
@       Made with ❤️ by litt1eb0y             @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

EOF
sleep 1

bold="\e[1m"
Underlined="\e[4m"
red="\e[31m"
green="\e[32m"
blue="\e[34m"
end="\e[0m"
VERSION="SEF_v0.1"

PRG=${0##*/}


Usage(){
	while read -r line; do
		printf "%b\n" "$line"
	done <<-EOF
	\r
	\r# ${bold}${blue}Options${end}:
	\r    -d, --domain       - Domain To enumerate
	\r    -o, --output       - Output file to save the Final Results
	\r    -s, --silent       - The Only output will be the found subdomains
	\r    -p, --parallel     - To Use Parallel For Faster Results.
	\r    -h, --help         - Displays this help message and exit.
  	\r    -v, --version      - Displays this version and exit.

EOF
	exit 1
}


spinner(){
	processing="${1}"
	while true;
	do
		dots=(
			"/"
			"-"
			"\\"
			"|"
			)
		for dot in ${dots[@]};
		do
			printf "[${dot}] ${processing} \U1F50E"
			printf "                                    \r"
			sleep 0.3
		done

	done
}


Subfinder() {
	[ "$silent" == True ] && subfinder -all -silent -d $domain  2>/dev/null | anew subenum-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}Subfinder${end}" &
			PID="$!"
		}
		subfinder -all -silent -d $domain  1> tmp-subfinder-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] SubFinder$end: $(wc -l< tmp-subfinder-$domain)"
	}
}


Assetfinder() {
	[ "$silent" == True ] && assetfinder --subs-only $domain 2>/dev/null | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}Assetfinder${end}" &
			PID="$!"
		}
		assetfinder --subs-only $domain 1> tmp-assetfinder-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] AssetFinder$end: $(wc -l< tmp-assetfinder-$domain)"
	}
}


Findomain() {
	[ "$silent" == True ] && findomain -t $domain -quiet 2>/dev/null | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}Findomain${end}" &
			PID="$!"
		}
		findomain -quiet -t $domain 1> tmp-findomain-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] Findomain$end: $(wc -l< tmp-findomain-$domain 2>/dev/null | awk '{print $1}')"
	}
}


Amass() {
	[ "$silent" == True ] && amass enum -d $domain 2>/dev/null | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}Amass${end}" &
			PID="$!"
		}
		amass enum  -d $domain 1> tmp-amass-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] Amass$end: $(wc -l< tmp-amass-$domain)"
	}
}


Gauplus() {
  [ "$silent" == True ] &&  gauplus -t 5 -random-agent -subs $domain |  unfurl -u domains 2>/dev/null  | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Gauplus${end}" &
      PID="$!"
    }
    gauplus -t 5 -random-agent -subs $domain | unfurl -u domains 1> tmp-gauplus-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Gauplus$end: $(wc -l< tmp-gauplus-$domain)"
  }
}


Waybackurls() {
  [ "$silent" == True ] &&  waybackurls $domain |  unfurl -u domains 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Waybackurls${end}" &
      PID="$!"
    }
    gauplus $domain | unfurl -u domains 1> tmp-waybackurls-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Waybackurls$end: $(wc -l< tmp-waybackurls-$domain)"
  }
}


Github-Subdomains() {
  [ "$silent" == True ] && github-subdomains -d $domain -t abcdefghijklmnopqrstuvwxyz | unfurl domains 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Github-Subdomains${end}" &
      PID="$!"
    }
    github-subdomains -d $domain -t abcdefghijklmnopqrstuvwxyz | unfurl domains 1> tmp-github-subdomains-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Github-Subdomains$end: $(wc -l< tmp-github-subdomains-$domain)"
  }
}


Crobat() {
  [ "$silent" == True ] && crobat -s $domain  2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Crobat${end}" &
      PID="$!"
    }
    crobat -s $domain 1> tmp-crobat-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Crobat$end: $(wc -l< tmp-crobat-$domain)"
  }
}


CTFR() {
  [ "$silent" == True ] && ctfr.py -d $domain | unfurl domains 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}CTFR${end}" &
      PID="$!"
    }
    ctfr.py -d $domain | unfurl domains 1> tmp-ctfr-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] CTFR$end: $(wc -l< tmp-ctfr-$domain)"
  }
}


Cero() {
	[ "$silent" == True ] && cero $domain 2>/dev/null | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}Cero${end}" &
			PID="$!"
		}
		cero $domain 1> tmp-cero-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] Cero$end: $(wc -l< tmp-cero-$domain)"
	}
}


Sublister() {
  [ "$silent" == True ] && sublist3r -d $domain | unfurl domains 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Sublister${end}" &
      PID="$!"
    }
    sublist3r -d $domain | unfurl domains 1> tmp-sublister-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Sublister$end: $(wc -l< tmp-sublister-$domain)"
  }
}


Sudomy() {
  [ "$silent" == True ] && sudomy -d $domain | unfurl domains 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Sudomy${end}" &
      PID="$!"
    }
    sudomy -d $domain | unfurl domains 1> tmp-sudomy-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Sudomy$end: $(wc -l< tmp-sudomy-$domain)"
  }
}


Shodomain() {
  [ "$silent" == True ] && shodomain.py abcdefghijklmnopqrstuvwxyz $domain 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Shodomain${end}" &
      PID="$!"
    }
    shodomain.py abcdefghijklmnopqrstuvwxyz $domain 1> tmp-shodomain-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Shodomain$end: $(wc -l< tmp-shodomain-$domain)"
  }
}


Censys-Subdomain-Finder() {
  [ "$silent" == True ] && censys-subdomain-finder.py --censys-api-id abcdefghijklmnopqrstuvwxyz --censys-api-secret abcdefghijklmnopqrstuvwxyz $domain 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Censys-Subdomain-Finder${end}" &
      PID="$!"
    }
    censys-subdomain-finder.py --censys-api-id abcdefghijklmnopqrstuvwxyz --censys-api-secret abcdefghijklmnopqrstuvwxyz $domain 1> tmp-censys-subdomain-finder.py-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Censys-Subdomain-Finder$end: $(wc -l< tmp-censys-subdomain-finder.py-$domain)"
  }
}


Archive() {
	[ "$silent" == True ] && curl -sk "http://web.archive.org/cdx/search/cdx?url=*.$domain&output=txt&fl=original&collapse=urlkey&page=" | awk -F/ '{gsub(/:.*/, "", $3); print $3}' | sort -u | anew subenum-$domain.txt  || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}Archive${end}" &
			PID="$!"
		}
		curl -sk "http://web.archive.org/cdx/search/cdx?url=*.$domain&output=txt&fl=original&collapse=urlkey&page=" | awk -F/ '{gsub(/:.*/, "", $3); print $3}' | sort -u > tmp-archive-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] Archive$end: $(wc -l< tmp-archive-$domain)"
	}
}


BufferOver() {
	[ "$silent" == True ] && curl -s "https://dns.bufferover.run/dns?q=.$domain" | grep $domain | awk -F, '{gsub("\"", "", $2); print $2}' | anew subenum-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}BufferOver${end}" &
			PID="$!"
		}
		curl -s "https://dns.bufferover.run/dns?q=.$domain" | grep $domain | awk -F, '{gsub("\"", "", $2); print $2}' | sort -u > tmp-bufferover-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] BufferOver$end: $(wc -l< tmp-bufferover-$domain)"
	}
}


Crt() {
	[ "$silent" == True ] && curl -sk "https://crt.sh/?q=%.$domain&output=json" | tr ',' '\n' | awk -F'"' '/name_value/ {gsub(/\*\./, "", $4); gsub(/\\n/,"\n",$4);print $4}' | anew subenum-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}crt.sh${end}" &
			PID="$!"
		}
		curl -sk "https://crt.sh/?q=%.$domain&output=json" | tr ',' '\n' | awk -F'"' '/name_value/ {gsub(/\*\./, "", $4); gsub(/\\n/,"\n",$4);print $4}' | sort -u > tmp-crt-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] crt.sh$end: $(wc -l< tmp-crt-$domain)"
	}
}


Riddler() {
  [ "$silent" == True ] && curl -sk "https://riddler.io/search/exportcsv?q=pld:$domain" | grep -Po "(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | anew subenum-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}riddler.io${end}" &
			PID="$!"
		}
		curl -sk "https://riddler.io/search/exportcsv?q=pld:$domain" | grep -Po "(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u > tmp-riddler-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] riddler.io$end: $(wc -l< tmp-riddler-$domain)"
	}
}


CertSpotter() {
  [ "$silent" == True ] && curl -sk "https://certspotter.com/api/v1/issuances?domain=$domain&include_subdomains=true&expand=dns_names" | jq .[].dns_names | grep -Po "(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | anew subenum-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}CertSpotter${end}" &
			PID="$!"
		}
		curl -sk "https://certspotter.com/api/v1/issuances?domain=$domain&include_subdomains=true&expand=dns_names" | jq .[].dns_names | grep -Po "(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u > tmp-certspotter-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] CertSpotter$end: $(wc -l< tmp-certspotter-$domain && echo)"
	}
}


JLDC() {
  [ "$silent" == True ] && curl -sk "https://jldc.me/anubis/subdomains/$domain" | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | anew subenum-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}JLDC${end}" &
			PID="$!"
		}
		curl -sk "https://jldc.me/anubis/subdomains/$domain" | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u > tmp-jldc-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] JLDC$end: $(wc -l< tmp-jldc-$domain)"
	}
}


nMap() {
  [ "$silent" == True ] && nmap --script hostmap-crtsh.nse $domain | unfurl domains | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}NMap${end}" &
			PID="$!"
		}
		nmap --script hostmap-crtsh.nse $domain | unfurl domains 1> tmp-nmap-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] NMap$end: $(wc -l< tmp-nmap-$domain)"
	}
}


HackerTarget() {
  [ "$silent" == True ] && curl -sk "https://api.hackertarget.com/hostsearch/?q=$domain" | unfurl domains | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}HackerTarget${end}" &
			PID="$!"
		}
		curl -sk "https://api.hackertarget.com/hostsearch/?q=$domain" | unfurl domains 1> tmp-hackertarget-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] HackerTarget$end: $(wc -l< tmp-hackertarget-$domain)"
	}
}


ThreatCrowd() {
	[ "$silent" == True ] && curl -sk "https://www.threatcrowd.org/searchApi/v2/domain/report/?domain=$domain" | jq -r '.subdomains' | grep -o "\w.*$domain" | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}ThreatCrowd${end}" &
			PID="$!"
		}
		curl -sk "https://www.threatcrowd.org/searchApi/v2/domain/report/?domain=$domain" | jq -r '.subdomains'  | grep -o "\w.*$domain" 1> tmp-threatcrowd-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] ThreatCrowd$end: $( wc -l< tmp-threatcrowd-$domain)"
	}
}


Anubis() {
	[ "$silent" == True ] && curl -sk "https://jldc.me/anubis/subdomains/$domain" | jq -r '.' | grep -o "\w.*$domain" | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}Anubis${end}" &
			PID="$!"
		}
		curl -sk "https://jldc.me/anubis/subdomains/$domain" | jq -r '.' | grep -o "\w.*$domain" 1> tmp-anubis-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] Anubis$end: $( wc -l< tmp-anubis-$domain)"
	}
}


ThreatMiner() {
	[ "$silent" == True ] && curl -sk "https://api.threatminer.org/v2/domain.php?q=$domain&rt=5" | jq -r '.results[]' |grep -o "\w.*$domain" | sort -u   | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}ThreatMiner${end}" &
			PID="$!"
		}
		curl -sk "https://api.threatminer.org/v2/domain.php?q=$domain&rt=5" | jq -r '.results[]' |grep -o "\w.*$domain" | sort -u   1> tmp-threatminer-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] ThreatMiner$end: $( wc -l< tmp-threatminer-$domain)"
	}
}


OUT(){
	[ "$silent" == False ] && {
		[ -n "$1" ] && out="$1" || out="$domain-subs.txt"
		sort -u tmp-* > $out
		echo -e $green"[+] The Final Results:$end $(wc -l $out)"
		[ $delete == True ] && rm tmp-*
	}
}

Main() {
	[ $domain == False ] && [ $hosts == False ] && { echo -e $red"[-] Argument -d/--domain OR -l/--list is Required!"$end; Usage; }
	[ $domain != False ] && {
			[[ ${PARALLEL} == True ]] && {
				spinner "Reconnaissance" &
				PID="$!"
				export -f Subfinder Assetfinder Findomain Amass Gauplus Waybackurls Github-Subdomains Crobat CTFR Cero Sublister Sudomy Shodomain Censys-Subdomain-Finder Archive BufferOver Crt Riddler CertSpotter JLDC nMap HackerTarget ThreatCrowd Anubis ThreatMiner spinner
				export domain silent bold end
				parallel ::: Subfinder Assetfinder Findomain Amass Gauplus Waybackurls Github-Subdomains Crobat CTFR Cero Sublister Sudomy Shodomain Censys-Subdomain-Finder Archive BufferOver Crt Riddler CertSpotter JLDC nMap HackerTarget ThreatCrowd Anubis ThreatMiner
				kill ${PID}
			} || {
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
        Archive
        BufferOver
        Crt
        Riddler
        CertSpotter
        JLDC
        nMap
        HackerTarget
        ThreatCrowd
        Anubis
        ThreatMiner
			}
			[ "$out" == False ] && OUT || OUT $out
		}
}


domain=False
silent=False
out=False
PARALLEL=False

list=(
        Subfinder
        Assetfinder
        Findomain
        Amass
        Gauplus
        Waybackurls
        Github-Subdomains
        crobat
        CTFR
        Cero
        Sublister
        Sudomy
        Shodomain
        Censys-Subdomain-Finder
        Archive
        BufferOver
        Crt
        Riddler
        CertSpotter
        JLDC
        nMap
        HackerTarget
        ThreatCrowd
        Anubis
        ThreatMiner
	)

while [ -n "$1" ]; do
	case $1 in
		-d|--domain)
			domain=$2
			shift ;;
		-o|--output)
			out=$2
			shift ;;
		-s|--silent)
			silent=True ;;
		-h|--help)
			Usage;;
		-p|--parallel)
			PARALLEL=True ;;
    -v|--version)
  		echo "Version: $VERSION"
  		exit 0 ;;
		*)
			echo "[-] Unknown Option: $1"
			Usage ;;
	esac
	shift
done

Main
