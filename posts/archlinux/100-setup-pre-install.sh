# Create the PWA2 Enterprise Wifi connection configuration
# iwctl station wlan0 scan
# iwctl station wlan0 get-networks

# Add the Wifi configuration
# cat <<EOF >/var/lib/iwd/{{SSID}}\ Wifi.psk
# [Security]
# Passphrase={passphrase}

# [Settings]
# AutoConnect=True
# EOF

# iwctl station wlan0 connect

# Set keyboard layout ot us intl
loadkeys us-acentos

# Set the timezone
timedatectl set-timezone America/Toronto
# Enable ntp
timedatectl set-ntp true
# Verify the date and time are correct
timedatectl status
