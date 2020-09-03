lb clean
lb config --debian-installer live
lb config --debian-installer-gui true
lb config --debian-installer-distribution buster
lb config --memtest none
lb clean
lb build
lb config --archive-areas "main contrib non-free"
lb config --parent-archive-areas "main contrib non-free"
lb config --security true
lb config –parent-distribution buster``
lb config --apt-indices true
lb config --apt apt
lb config --architectures amd64
lb config --binary-images iso-hybrid
lb config --image-name remaster
lb config --iso-publisher "Aderbal Botelho aderbal@educatux.com.br"
lb config --interactive shell
echo "xfce4 xfce4-indicator-plugin xfce4-power-manager xfce4-battery-plugin xfce4-datetime-plugin xfce4-mount-plugin xfce4-netload-plugin xfce4-wavelan-plugin xfce4-screenshooter xfce4-sensors-plugin xfce4-smartbookmark-plugin xfce4-timer-plugin xfce4-whiskermenu-plugin xfce4-goodies" >> config/package-lists/grafica.list.chroot
echo "gdebi file-roller lsb-release build-essential module-assistant linux-headers-amd64 gedit vlc mugshot ristretto nemo unrar-free rar file-roller p7zip unzip gnome-system-tools ssh net-tools gnome-calculator gcc quota engrampa libuser bash-completion evince pulseaudio-equalizer cups hplip accountsservice mugshot apt-transport-https network-manager network-manager-gnome net-tools" >> config/package-lists/diversos.list.chroot
lb clean
lb build

