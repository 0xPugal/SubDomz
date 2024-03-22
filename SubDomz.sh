#!/bin/bash

#colours
BOLD="\e[1m"
UNDERLINE="\e[4m"
RED="\e[31m"
GREEN="\e[32m"
BLUE="\e[34"
CYAN="\e[36m"
NC="\e[0m"
VERSION="2.0"

PRG=${0##*/}

Usage() {
        while read -r line; do
                printf "%b\n" "$line"
        done <<-EOF
        \r# ${BOLD}${GREEN}Options:${NC}
        \r      -d, --domain            - Domain to enumerate
        \r      -l, --list              - List of root domains to enumerate
        \r      -u, --use               - Specify which tools to be used (Ex: subfinder, amass, crt,...)
        \r      -e, --exclude           - Specify which tools to be excluded (Ex: findomain, wayback, gau,...)
        \r      -o, --output            - Output file to save final results ( Default: <target>-Date-Time.txt)
        \r      -s, --silent            - Show only subdomains in output
        \r      -hp, --http-probe       - probe for working http/https servers
        \r      -k, --keep              - keep the temporary files ( output from each tools)
        \r      -p, --parallel          - Run parallely for faster results. Doesn't Work With -e/--exclude or -u/--use.
        \r      -h, --help              - Display this help message and exit
        \r      -v, --version           - Display the version and exit
        \r      -ls, --list-sources     - Display all available sources/tools

EOF
        exit 1
}

ListSources() {
    echo -e "${BOLD}${CYAN}Available Sources/Tools:${NC}"
    echo "Subfinder"
    echo "Amass"
    echo "Assetfinder"
    echo "Chaos"
    echo "Findomain"
    echo "Haktrails"
    echo "Gau"
    echo "Github-subdomains"
    echo "Gitlab-subdomains"
    echo "Crobat"
    echo "Cero"
    echo "Shosubgo"
    echo "Censys"
    echo "Crtsh"
    echo "JLDC-anubis"
    echo "Alienvault"
    echo "Subdomain-center"
    echo "Certspotter"
    exit 1
}


spinner() {
        processing="${1}"
        while true;
        do
                dots=( "/" "-" "\\" "|" )
                for dot in ${dots[@]};
                do
                        printf "[${dot}] ${processing} \U1F50E"
                        printf "                                        \r"
                        sleep 0.2
                done
        done
}

Subfinder() {
	[ "$silent" == True ] && subfinder -all -silent -pc $SUBFINDER_CONFIG -d $domain 2>/dev/null | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}Subfinder${NC}" &
			PID="$!"
		}
		subfinder -all -silent -pc $SUBFINDER_CONFIG -d $domain 1> tmp-subfinder-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] SubFinder$NC: $(wc -l < tmp-subfinder-$domain)"
	}
}

Amass() {
	[ "$silent" == True ] && amass enum -passive -norecursive -noalts -d $domain -config $AMASS_CONFIG 2>/dev/null | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}Amass${NC}" &
			PID="$!"
		}
		amass enum -passive -norecursive -noalts -d $domain -config $AMASS_CONFIG 1> tmp-amass-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] Amass$NC: $(wc -l < tmp-amass-$domain)"
	}
}

Assetfinder() {
	[ "$silent" == True ] && assetfinder --subs-only $domain | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}Assetfinder${NC}" &
			PID="$!"
		}
		assetfinder --subs-only $domain > tmp-assetfinder-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] Assetfinder$NC: $(wc -l < tmp-assetfinder-$domain)"
	}
}

Chaos() {
	[ "$silent" == True ] && chaos -silent -key $CHAOS_API_KEY -d $domain | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}Chaos${NC}" &
			PID="$!"
		}
		chaos -silent -key $CHAOS_API_KEY -d $domain > tmp-chaos-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] Chaos$NC: $(wc -l < tmp-chaos-$domain)"
	}
}

Findomain() {
	[ "$silent" == True ] && findomain -t $domain -q 2>/dev/null | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}Findomain${NC}" &
			PID="$!"
		}
		findomain -t $domain -u tmp-findomain-$domain &>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] Findomain$NC: $(wc -l tmp-findomain-$domain 2>/dev/null | awk '{print $1}')"
	}
}

Haktrails() {
	[ "$silent" == True ] && echo "$domain" | haktrails subdomains 2>/dev/null | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}Haktrails${NC}" &
			PID="$!"
		}
		echo "$domain" | haktrails subdomains 1> tmp-haktrails-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] Haktrails$NC: $(wc -l tmp-haktrails-$domain)"
	}
}

Gau() {
        [ "$silent" == True ] &&  gau --threads 10 --subs $domain |  unfurl -u domains | anew subdomz-$domain.txt || {
                [[ ${PARALLEL} == True ]] || { spinner "${BOLD}Gau${NC}" &
                        PID="$!"
                }
                gau --threads 10 --subs $domain | unfurl -u domains > tmp-gau-$domain
                [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
                echo -e "$BOLD[*] Gau$NC: $( wc -l < tmp-gau-$domain)"
        }
}

Github-Subdomains() {
        [ "$silent" == True ] && github-subdomains -d $domain -t $GITHUB_TOKEN | unfurl domains | grep "$domain" 2>/dev/null | anew subdomz-$domain.txt || {
                [[ ${PARALLEL} == True ]] || { spinner "${BOLD}Github-Subdomains${NC}" &
                        PID="$!"
                }
                github-subdomains -d $domain -t $GITHUB_TOKEN | unfurl domains | grep "$domain" 1> tmp-github-subdomains-$domain 2>/dev/null
                [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
                echo -e "$BOLD[*] Github-Subdomains$NC: $( wc -l < tmp-github-subdomains-$domain)"
        }
}

Gitlab-Subdomains() {
        [ "$silent" == True ] && gitlab-subdomains -d $domain -t $GITLAB_TOKEN | unfurl domains | grep "$domain" 2>/dev/null | anew subdomz-$domain.txt || {
                [[ ${PARALLEL} == True ]] || { spinner "${BOLD}Gitlab-Subdomains${NC}" &
                        PID="$!"
                }
                gitlab-subdomains -d $domain -t $GITLAB_TOKEN | unfurl domains | grep "$domain" 1> tmp-gitlab-subdomains-$domain 2>/dev/null
                [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
                echo -e "$BOLD[*] Github-Subdomains$NC: $( wc -l < tmp-gitlab-subdomains-$domain)"
        }
}

Crobat() {
        [ "$silent" == True ] && crobat -s $domain  2>/dev/null | anew subdomz-$domain.txt || {
                [[ ${PARALLEL} == True ]] || { spinner "${BOLD}crobat${NC}" &
                        PID="$!"
                }
                crobat -s $domain 1> tmp-crobat-$domain 2>/dev/null
                [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
                echo -e "$BOLD[*] crobat$NC: $( wc -l < tmp-crobat-$domain)"
        }
}

Cero() {
	[ "$silent" == True ] && cero $domain 2>/dev/null | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}Cero${NC}" &
			PID="$!"
		}
		cero $domain 1> tmp-cero-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] Cero$NC: $( wc -l < tmp-cero-$domain)"
	}
}

Shosubgo() {
	[ "$silent" == True ] && shosubgo -d $domain -s $SHODAN_API_KEY 2>/dev/null | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}Shosubgo${NC}" &
			PID="$!"
		}
		shosubgo -d $domain -s $SHODAN_API_KEY 1> tmp-shosubgo-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] Shosubgo$NC: $( wc -l < tmp-shosubgo-$domain)"
	}
}

Censys() {
	[ "$silent" == True ] && censys subdomains $domain 2>/dev/null | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}Censys${NC}" &
			PID="$!"
		}
		censys subdomains $domain 1> tmp-censys-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] Censys$NC: $( wc -l < tmp-censys-$domain)"
	}
}

Crtsh() {
	[ "$silent" == True ] && curl -sk "https://crt.sh/?q=%.$domain&output=json" | tr ',' '\n' | awk -F'"' '/name_value/ {gsub(/\*\./, "", $4); gsub(/\\n/,"\n",$4);print $4}' | grep -w "$domain\$" | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}Crtsh${NC}" &
			PID="$!"
		}
		curl -sk "https://crt.sh/?q=%.$domain&output=json" | tr ',' '\n' | awk -F'"' '/name_value/ {gsub(/\*\./, "", $4); gsub(/\\n/,"\n",$4);print $4}' | grep -w "$domain\$" | sort -u > tmp-crt-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] Crtsh$NC: $( wc -l < tmp-crt-$domain)"
	}
}

JLDC() {
  [ "$silent" == True ] && curl -sk "https://jldc.me/anubis/subdomains/$domain" | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}JLDC${NC}" &
			PID="$!"
		}
		curl -sk "https://jldc.me/anubis/subdomains/$domain" | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u > tmp-jldc-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] JLDC$NC: $( wc -l < tmp-jldc-$domain)"
	}
}

Alienvault() {
  [ "$silent" == True ] && curl -s "https://otx.alienvault.com/api/v1/indicators/domain/$domain/url_list?limit=1000&page=100" | grep -o '"hostname": *"[^"]*' | sed 's/"hostname": "//' | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}Alienvault${NC}" &
			PID="$!"
		}
		curl -s "https://otx.alienvault.com/api/v1/indicators/domain/$domain/url_list?limit=1000&page=100" | grep -o '"hostname": *"[^"]*' | sed 's/"hostname": "//' | sort -u > tmp-alienvault-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] Alienvault$NC: $( wc -l < tmp-alienvault-$domain)"
	}
}

Subdomain-center() {
  [ "$silent" == True ] && curl "https://api.subdomain.center/?domain=$domain" -s | jq -r '.[]' | sort -u | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}Subdomain center${NC}" &
			PID="$!"
		}
		curl "https://api.subdomain.center/?domain=$domain" -s | jq -r '.[]' | sort -u > tmp-subdomaincenter-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] Subdomain center$NC: $( wc -l < tmp-subdomaincenter-$domain)"
	}
}

Certspotter() {
  [ "$silent" == True ] && curl -sk "https://api.certspotter.com/v1/issuances?domain=$domain&include_subdomains=true&expand=dns_names" | jq -r '.[].dns_names[]' | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${BOLD}CertSpotter${NC}" &
			PID="$!"
		}
		curl -sk "https://api.certspotter.com/v1/issuances?domain=$domain&include_subdomains=true&expand=dns_names" | jq -r '.[].dns_names[]' | sort -u > tmp-certspotter-$domain
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$BOLD[*] CertSpotter$NC: $( wc -l < tmp-certspotter-$domain && echo)"
	}
}

Use() {
        for i in $lu; 
        do
                $i
        done
        [[ $out != False ]] && Out $out || Out
}

Exclude() {
        for i in ${list[@]}; 
        do
                if [[ " ${le[@]} " =~ " ${i} " ]]; then
                        continue
                else
                        $i
                fi
        done
        [[ $out != False ]] && Out $out || Out
}

Out() {
        [ "$silent" == False ] && { 
		[ -n "$1" ] && output="$1" || output="$domain-$(date +'%Y-%m-%d').txt"
		result=$(sort -u tmp-* | wc -l)
		sort -u tmp-* >> $output
		echo -e $GREEN"[+] The Final subdomains:$NC ${result}"
		[ $httprobe == True ] && Alive "$output" "$domain"
		[ $delete == True ] && rm tmp-*	
	}
}

Alive() {
        [ "$silent" == False ] && printf "$BOLD[+] HTTP probing... $NC"
	printf "                        \r"
	cat $1 | httpx -silent > "alive-$2.txt"
	[ "$silent" == False ] && echo -e $GREEN"[+] Alive Subdomains:$NC $(wc -l < alive-$2.txt)"
}

List() {
	lines=$(wc -l < $hosts)
	count=1
	while read domain; do
		[ "$silent" == False ] && echo -e "\n${UNDERLINE}${BOLD}${CYAN}[+] Domain ($count/$lines):${NC} ${domain}"
		[ $prv == "a" ] && {
			[[ ${PARALLEL} == True ]] && {
				spinner "Enumerating" &
				PID="$!"
				export -f Subfinder Amass Assetfinder Chaos Findomain Haktrails Gau Github-subdomains Gitlab-subdomains Crobat Cero Shosubgo Censys Crtsh JLDC Alienvault Subdomain-center Certspotter spinner
				export domain silent BOLD NC
				parallel -j18 ::: Subfinder Amass Assetfinder Chaos Findomain Haktrails Gau Github-subdomains Gitlab-subdomains Crobat Cero Shosubgo Censys Crtsh JLDC Alienvault Subdomain-center Certspotter
				kill ${PID}
				[[ $out != False ]] && Out $out || Out
			} || {
				Subfinder
                                Amass
                                Assetfinder
                                Chaos
                                Findomain
                                Haktrails
                                Gau
                                Github-subdomains
                                Gitlab-subdomains
                                Crobat
                                Cero
                                Shosubgo
                                Censys
                                Crtsh
                                JLDC
                                Alienvault
                                Subdomain-center
                                Certspotter
				[[ $out != False ]] && Out $out || Out
			}
		}
		[ $prv == "e" ] && Exclude 
		[ $prv == "u" ] && Use 
		let count+=1
	done < $hosts
}

Main() {
	[ $domain == False ] && [ $hosts == False ]
	[ $use != False ] && [ $exclude != False ] && { echo -e $UNDERLINE$RED"[!] You can use only one option: -e/--exclude or -u/--use"$NC; Usage; }
	[ $domain != False ] && { 
		[ $use == False ] && [ $exclude == False ] && { 
			[[ ${PARALLEL} == True ]] && {
				spinner "Enumerating" &
				PID="$!"
				export -f Subfinder Amass Assetfinder Chaos Findomain Haktrails Gau Github-subdomains Gitlab-subdomains Crobat Cero Shosubgo Censys Crtsh JLDC Alienvault Subdomain-center Certspotter spinner
				export domain silent BOLD NC
				parallel -j18 ::: Subfinder Amass Assetfinder Chaos Findomain Haktrails Gau Github-subdomains Gitlab-subdomains Crobat Cero Shosubgo Censys Crtsh JLDC Alienvault Subdomain-center Certspotter
				kill ${PID}
			} || {
				Subfinder
                                Amass
                                Assetfinder
                                Chaos
                                Findomain
                                Haktrails
                                Gau
                                Github-subdomains
                                Gitlab-subdomains
                                Crobat
                                Cero
                                Shosubgo
                                Censys
                                Crtsh
                                JLDC
                                Alienvault
                                Subdomain-center
                                Certspotter
			}
			[ $out == False ] && Out || Out $out
		} || { 
			[ $use != False ] && Use 
			[ $exclude != False ] && Exclude
		}
	}
	[ "$hosts" != False ] && { 
		[ $use != False ] && prv=u
		[ $exclude != False ] && prv=e
		[ $use == False ] && [ $exclude == False ] && prv=a
		List
	 } 
}

domain=False
hosts=False
use=False
exclude=False
silent=False
delete=True
out=False
httprobe=False
PARALLEL=False

list=(
        Subfinder
        Amass
        Assetfinder
        Chaos
        Findomain
        Haktrails
        Gau
        Github-subdomains
        Gitlab-subdomains
        Crobat
        Cero
        Shosubgo
        Censys
        Crtsh
        JLDC
        Alienvault
        Subdomain-center
        Certspotter
        )

while [ -n "$1" ]; do
	case $1 in
		-d|--domain)
			domain=$2
			shift ;;
		-l|--list)
			hosts=$2
			shift ;;
		-u|--use)
			use=$2
			lu=${use//,/ }
			for i in $lu; do
				if [[ ! " ${list[@]} " =~ " ${i} " ]]; then
					echo -e $RED$UNDERLINE"[-] Unknown Function: $i"$NC
					Usage
				fi
			done
			shift ;;
		-e|--exclude)
			exclude=$2
			le=${exclude//,/ }
			for i in $le; do
				if [[ ! " ${list[@]} " =~ " ${i} " ]]; then
					echo -e $RED$UNDERLINE"[-] Unknown Function: $i"$NC
					Usage
				fi
			done
			shift ;;
		-o|--output)
			out=$2
			shift ;;
		-s|--silent)
			silent=True ;;
		-k|--keep)
			delete=False ;;
		-hp|--http-probe)
			httprobe=True ;;
		-h|--help)
			Usage;;
		-p|--parallel)
			PARALLEL=True ;;
		-v|--version)
			echo -e "${BOLD} SubDomz $VERSION $NC"
			exit 0 ;;
                -ls|--list-sources)
                        ListSources
                        ;;
		*)
			echo "[-] Unknown Option: $1"
			Usage ;;
	esac
	shift
done

[ "$silent" == False ] && echo -e $CYAN"""
   _____       __    ____                     
  / ___/__  __/ /_  / __ \____  ____ ___  ____
  \__ \/ / / / __ \/ / / / __ \/ __ '__ \/_  /
 ___/ / /_/ / /_/ / /_/ / /_/ / / / / / / / /_
/____/\__,_/_.___/_____/\____/_/ /_/ /_/ /___/ $VERSION

 All in One Passive Subdomain Enumeration tool
                                $GREEN by @0xPugal $NC
"""$NC

Main
