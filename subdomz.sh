#!/bin/bash
#
# A small Bash script for subdomain enumeration using various tools and online services
##############################################################################
## ~~~~~~~~~~~~~ Tools ~~~~~~~~~~~~~~~~ ## ~~~~~~ Online Services ~~~~~~~~~ ##
##      * Subfinder                     ##      * Wayback Machine           ##
##      * Assetfinder                   ##      * Crt.sh                    ##
##      * Findomain                     ##      * Bufferover.run            ##
##      * Amass                         ##      * Riddler.io                ##
##      * Github-Subdomains             ##      * Certspotter               ##
##      * Censys-Subdomain-Finder       ##      * Archive                   ##
##      * Shodomain                     ##      * JLDC                      ##
##      * Chrobat                       ##      * Security Trails           ##
##      * Gauplus                       ##      * CommonCrawl               ##
##      * Waybackurls                   ##      * ThreadCrowd               ##
##      * CTFR                          ##      * HackerTarget              ##
##############################################################################
# This script is originally made by @itsbing0o and I made a changes to work more effectively
sleep 1
cat <<"EOF"
               __        __
   _______  __/ /_  ____/ /___  ____ ___  ____
  / ___/ / / / __ \/ __  / __ \/ __ `__ \/_  /
 (__  ) /_/ / /_/ / /_/ / /_/ / / / / / / / /_
/____/\__,_/_.___/\__,_/\____/_/ /_/ /_/ /___/

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@   All in One Subdomain Enumeration Tool    @
@--------------------------------------------@
@       Made with ❤️ by litt1eb0y            @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

EOF
sleep 1

bold="\e[1m"
Underlined="\e[4m"
red="\e[31m"
green="\e[32m"
blue="\e[34m"
end="\e[0m"
VERSION="2022-03-20"

PRG=${0##*/}


Usage(){
	while read -r line; do
		printf "%b\n" "$line"
	done <<-EOF
	\r
	\r# ${bold}${blue}Options${end}:
	\r    -d, --domain       - Domain To Enumerate
	\r    -l, --list         - List of domains
	\r    -o, --output       - The output file to save the Final Results
	\r    -s, --silent       - The Only output will be the found subdomains
	\r    -p, --parallel     - To Use Parallel For Faster Results.
	\r    -h, --help         - Displays this help message and exit.

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
	[ "$silent" == True ] && subfinder -all -silent -d $domain 2>/dev/null | anew subenum-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}SubFinder${end}" &
			PID="$!"
		}
		subfinder -all -silent -d $domain 1> tmp-subfinder-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] SubFinder$end: $(echo && cat < tmp-subfinder-$domain && echo )"
	}
}


Assetfinder() {
	[ "$silent" == True ] && assetfinder --subs-only $domain | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}AssetFinder${end}" &
			PID="$!"
		}
		assetfinder --subs-only $domain 1> tmp-assetfinder-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] AssetFinder$end: $(echo && cat < tmp-assetfinder-$domain && echo )"
	}
}


Findomain() {
	[ "$silent" == True ] && findomain -t $domain -quiet | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}Findomain${end}" &
			PID="$!"
		}
		findomain -quiet -t $domain 1> tmp-findomain-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] Findomain$end: $(echo && cat < tmp-findomain-$domain && echo )"
	}
}


Amass() {
	[ "$silent" == True ] && amass enum -config ~/.config/amass/config.ini -d $domain 2>/dev/null | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}Amass${end}" &
			PID="$!"
		}
		amass enum -config ~/.config/amass/config.ini -d $domain 1> tmp-amass-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] Amass$end: $(echo && cat < tmp-amass-$domain && echo )"
	}
}


Gauplus() {
  [ "$silent" == True ] &&  gauplus -t 5 -random-agent -subs $domain |  unfurl -u domains 2>/dev/null  | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Gauplus${end}" &
      PID="$!"
    }
    gauplus -t 5 -random-agent -subs $domain | unfurl -u domains 1> tmp-gauplus-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Gauplus$end: $(echo && cat < tmp-gauplus-$domain && echo )"
  }
}


Waybackurls() {
  [ "$silent" == True ] &&  waybackurls $domain |  unfurl -u domains 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Waybackurls${end}" &
      PID="$!"
    }
    gauplus $domain | unfurl -u domains 1> tmp-waybackurls-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Waybackurls$end: $(echo && cat < tmp-waybackurls-$domain && echo )"
  }
}


Github-Subdomains() {
  [ "$silent" == True ] && github-subdomains -d $domain -t tokens.txt | unfurl domains 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Github-Subdomains${end}" &
      PID="$!"
    }
    github-subdomains -d $domain -t tokens.txt | unfurl domains 1> tmp-github-subdomains-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Github-Subdomains$end: $(echo && cat < tmp-github-subdomains-$domain && echo )"
  }
}


Chrobat() {
  [ "$silent" == True ] && chrobat -s $domain  2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Chrobat${end}" &
      PID="$!"
    }
    chrobat -s $domain 1> tmp-chrobat-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Chrobat$end: $(echo && cat < tmp-chrobat-$domain && echo )"
  }
}


CTFR() {
  [ "$silent" == True ] && ctfr -d $domain | unfurl domains 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}CTFR${end}" &
      PID="$!"
    }
    ctfr -d $domain | unfurl domains 1> tmp-ctfr-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] CTFR$end: $(echo && cat < tmp-ctfr-$domain && echo )"
  }
}


Cero() {
	[ "$silent" == True ] && cero $domain | anew subdomz-$domain.txt || {
		[[ ${PARALLEL} == True ]] || { spinner "${bold}Cero${end}" &
			PID="$!"
		}
		cero $domain 1> tmp-cero-$domain 2>/dev/null
		[[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
		echo -e "$bold[*] Cero$end: $(echo && cat < tmp-cero-$domain && echo )"
	}
}


Sublister() {
  [ "$silent" == True ] && sublist3r -d $domain | unfurl domains 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Sublister${end}" &
      PID="$!"
    }
    sublist3r -d $domain | unfurl domains 1> tmp-sublister-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Sublister$end: $(echo && cat < tmp-sublister-$domain && echo )"
  }
}


Sudomy() {
  [ "$silent" == True ] && subdomy -d $domain | unfurl domains 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Sudomy${end}" &
      PID="$!"
    }
    subdomy -d $domain | unfurl domains 1> tmp-sudomy-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Sudomy$end: $(echo && cat < tmp-sudomy-$domain && echo )"
  }
}


Shodomain() {
  [ "$silent" == True ] && shodomain <API-KEY> $domain 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Shodomain${end}" &
      PID="$!"
    }
    shodomain <API-KEY> $domain 1> tmp-shodomain-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Shodomain$end: $(echo && cat < tmp-shodomain-$domain && echo )"
  }
}


Censys-Subdomain-Finder() {
  [ "$silent" == True ] && censys-subdomain-finder.py --censys-api-id <CENSYS_API_ID> --censys-api-secret <CENSYS_API_SECRET> $domain 2>/dev/null | anew subdomz-$domain.txt || {
    [[ ${PARALLEL} == True ]] || { spinner "${bold}Censys-Subdomain-Finder${end}" &
      PID="$!"
    }
    censys-subdomain-finder.py --censys-api-id <CENSYS_API_ID> --censys-api-secret <CENSYS_API_SECRET> $domain 1> tmp-censys-subdomain-finder.py-$domain 2>/dev/null
    [[ ${PARALLEL} == True ]] || kill ${PID} 2>/dev/null
    echo -e "$bold[*] Censys-Subdomain-Finder$end: $(echo && cat < tmp-censys-subdomain-finder.py-$domain && echo )"
  }
}


USE() {
	for i in $lu; do
			$i
	done
	OUT
}


EXCLUDE() {
	for i in ${list[@]}; do
		if [[ " ${le[@]} " =~ " ${i} " ]]; then
			continue
		else
			$i
		fi
	done
	OUT
}

OUT(){
	[ "$silent" == False ] && {
		[ -n "$1" ] && out="$1" || out="$domain-$(date +'%Y-%m-%d').txt"
		sort -u tmp-* > $out
		echo -e $green"[+] The Final Results:$end $(wc -l $out)"
		[ $resolve == True ] && ALIVE "$out" "$domain"

		[ $delete == True ] && rm tmp-*
	}
}

ALIVE() {
	[ "$silent" == False ] && printf "$bold[+] Resolving $end"
	printf "                        \r"
	cat $1 | httprobe -c $thread > "resolved-$2.txt"
	[ "$silent" == False ] && echo -e $green"[+] Resolved:$end $(wc -l < resolved-$2.txt)"

}


LIST() {
	lines=$(wc -l < $hosts)
	count=1
	while read domain; do
		[ "$silent" == False ] && echo -e "\n${Underlined}${bold}${green}[+] Domain ($count/$lines):${end} ${domain}"
		[ $prv == "a" ] && {
			[[ ${PARALLEL} == True ]] && {
				spinner "Reconnaissance" &
				PID="$!"
				export -f Subfinder Assetfinder Findomain Amass Gauplus Waybackurls Github-Subdomains Chrobat CTFR Cero Sublilster Sudomy Shodomain Censys-Subdomain-Finder spinner
				export domain silent bold end
				parallel ::: Subfinder Assetfinder Findomain Amass Gauplus Waybackurls Github-Subdomains Chrobat CTFR Cero Sublilster Sudomy Shodomain Censys-Subdomain-Finder
				kill ${PID}
				OUT
			} || {
        SubFinder
        Assetfinder
        Findomain
        Amass
        Gauplus
        Waybackurls
        Github-Subdomains
        Chrobat
        CTFR
        Cero
        Sublister
        Sudomy
        Shodomain
        Censys-Subdomain-Finder
				OUT
			}
		}
		[ $prv == "e" ] && EXCLUDE
		[ $prv == "u" ] && USE
		let count+=1
	done < $hosts
}

Main() {
	[ $domain == False ] && [ $hosts == False ] && { echo -e $red"[-] Argument -d/--domain OR -l/--list is Required!"$end; Usage; }
	[ $domain != False ] && {
		[ $use == False ] && [ $exclude == False ] && {
			[[ ${PARALLEL} == True ]] && {
				spinner "Reconnaissance" &
				PID="$!"
				export -f Subfinder Assetfinder Findomain Amass Gauplus Waybackurls Github-Subdomains Chrobat CTFR Cero Sublilster Sudomy Shodomain Censys-Subdomain-Finder spinner
				export domain silent bold end
				parallel ::: Subfinder Assetfinder Findomain Amass Gauplus Waybackurls Github-Subdomains Chrobat CTFR Cero Sublilster Sudomy Shodomain Censys-Subdomain-Finder
				kill ${PID}
			} || {
        SubFinder
        Assetfinder
        Findomain
        Amass
        Gauplus
        Waybackurls
        Github-Subdomains
        Chrobat
        CTFR
        Cero
        Sublister
        Sudomy
        Shodomain
        Censys-Subdomain-Finder
			}
			[ "$out" == False ] && OUT || OUT $out
		} || {
			[ $use != False ] && USE
			[ $exclude != False ] && EXCLUDE
		}
	}
	[ "$hosts" != False ] && {
		[ $use != False ] && prv=u
		[ $exclude != False ] && prv=e
		[ $use == False ] && [ $exclude == False ] && prv=a
		LIST
	 }
}


domain=False
hosts=False
use=False
exclude=False
silent=False
delete=True
out=False
resolve=False
thread=40
PARALLEL=False

list=(
        SubFinder
        Assetfinder
        Findomain
        Amass
        Gauplus
        Waybackurls
        Github-Subdomains
        Chrobat
        CTFR
        Cero
        Sublister
        Sudomy
        Shodomain
        Censys-Subdomain-Finder
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
					echo -e $red$Underlined"[-] Unknown Function: $i"$end
					Usage
				fi
			done
			shift ;;
		-e|--exclude)
			exclude=$2
			le=${exclude//,/ }
			for i in $le; do
				if [[ ! " ${list[@]} " =~ " ${i} " ]]; then
					echo -e $red$Underlined"[-] Unknown Function: $i"$end
					Usage
				fi
			done
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
		*)
			echo "[-] Unknown Option: $1"
			Usage ;;
	esac
	shift
done

Main
