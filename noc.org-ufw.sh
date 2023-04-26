#!/bin/sh

curl -s https://noc.org/ipv4 -o /tmp/noc_ips
echo "" >> /tmp/noc_ips

# Allow all traffic from noc.org IPs (no ports restriction)
for cfip in `cat /tmp/noc_ips`; do ufw allow proto tcp from $cfip comment 'noc.org CDN IP'; done

ufw reload > /dev/null

# OTHER EXAMPLE RULES
# Retrict to port 80
#for cfip in `cat /tmp/noc_ips`; do ufw allow proto tcp from $cfip to any port 80 comment 'Cloudflare IP'; done

# Restrict to port 443
#for cfip in `cat /tmp/noc_ips`; do ufw allow proto tcp from $cfip to any port 443 comment 'Cloudflare IP'; done

# Restrict to ports 80 & 443
#for cfip in `cat /tmp/noc_ips`; do ufw allow proto tcp from $cfip to any port 80,443 comment 'Cloudflare IP'; done
