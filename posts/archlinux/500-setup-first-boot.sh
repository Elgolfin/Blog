systemctl enable --now iwd systemd-resolved systemd-networkd

# Previous command should have create the folder /etc/iwd
touch /etc/iwd/main.conf
cat <<EOF >/etc/iwd/main.conf
[General]
EnableNetworkConfiguration=true
EOF

# Configure wired networks
touch /etc/systemd/network/20-wired.network
cat <<EOF >/etc/systemd/network/20-wired.network
[Match]
Name=enp1s*

[Network]
DHCP=yes
EOF

# Manually configure the Wifi
# iwctl