ip="$(dig +short myip.opendns.com @resolver1.opendns.com)"

if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
	echo $ip
else
	echo ""
fi
