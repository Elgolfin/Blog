systemctl enable --now iwd systemd-resolved systemd-networkd

# Previous command should have create the folder /etc/iwd
touch /etc/iwd/main.conf
cat <<EOF >/etc/iwd/main.conf
[General]
EnableNetworkConfiguration=true
EOF

# Manually configure the Wifi
iwctl