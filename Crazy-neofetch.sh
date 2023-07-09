#!/bin/bash

# Array of available distros
distros=("Arch" "Ubuntu" "Fedora" "Debian" "Gentoo" "CentOS" "OpenSUSE" "NixOS" "AIX" "Hash" "alpine_small" "Alpine" "Alter" "Amazon" "Anarchy" "android_small" "Android" "Antergos" "antiX" "AOSC OS/Retro" "AOSC OS" "Apricity"
"arcolinux_small" "ArcoLinux" "arch_small" "arch_old" "ArchBox" "ARCHlabs"  "ArchStrike" "XFerience" "ArchMerge"  "artix_small" "Artix" "Arya"  "Bedrock" "Bitrig" "BlackArch" "BLAG" "BlankOn"
"BlueLight" "bonsai" "BSD" "BunsenLabs" "Calculate" "Carbs" "centos_small" "Chakra" "ChaletOS" "Chapeau" "Chrom" "cleanjaro_small" "Cleanjaro"  "ClearOS" "Clear Linux OS" "Clover"  "Condres" "Container Linux by CoreOS"  "crux_small"
"CRUX" "Cucumber" "dahlia" "debian_small" "Deepin" "DesaOS" "Devuan" "DracOS"  "DarkOs" "Itc" "dragonfly_old" "dragonfly_small" "DragonFly" "Drauger" "elementary_small" "Elementary" "EndeavourOS" "Endless" "EuroLinux" "Exherbo"  "fedora_small" "Feren"
"freebsd_small" "FreeBSD" "FreeMiNT" "Frugalware" "Funtoo" "GalliumOS" "Garuda" "gentoo_small" "Pentoo"  "gNewSense" "GNOME" "GNU" "GoboLinux" "Grombyang" "guix_small" "Guix" "haiku_small" "Haiku" "Huayra" "hyperbola_small" "Hyperbola" "januslinux" "Kali"
 "KaOS" "KDE" "Kibojoe" "Kogaion" "Korora" "KSLinux" "Kubuntu" "LEDE" "Linux" "linuxlite_small" "Linux Lite" "LMDE" "Lubuntu" "Lunar"   "mac" "Darwin" "mageia_small" "Mageia" "MagpieOS" "Mandriva"  "manjaro_small" "Manjaro" "Maui" "Mer" "Minix"
 "linuxmint_small" "Linux Mint Old" "Linux Mint" "mx_small" "MX" "Namib" "Neptune" "netbsd_small" "NetBSD" "Netrunner" "Nitrux" "nixos_small" "NixOS" "Nurunner"
 "NuTyX" "OBRevenge" "openbsd_small" "OpenBSD" "openEuler" "OpenIndiana" "openmamba" "OpenMandriva" "OpenStage" "OpenWrt" "Open Source Media Center" "Oracle" "OS Elbrus" "PacBSD"
  "parabola_small" "Parabola" "Pardus" "Parrot" "Parsix" "PCBSD" "PCLinuxOS" "Peppermint" "popos_small" "Pop!_OS" "Porteus" "postmarketos_small" "PostMarketOS" "Proxmox" "Puppy" "pureos_small" "PureOS" "Qubes" "Radix" "Raspbian_small" "Raspbian" "Reborn OS" "Red Star" "Redcore"
  "redhat_old" "Redhat" "Refracted Devuan"  "Regata"   "Regolith" "Rosa" "sabotage" "Sabayon" "Sailfish" "SalentOS" "Scientific" "Septor" "Serene" "Siduction" "slackware_small" "Slackware" "SliTaz" "SmartOS" "Solus" "Source Mage" "Sparky" "Star" "SteamOS" "sunos_small" "SunOS" "openSUSE Leap" "openSUSE Tumbleweed"
   "opensuse_small" "SwagArch" "Tails" "Trisquel" "Ubuntu Cinnamon" "Ubuntu Budgie" "Ubuntu-GNOME" "Ubuntu MATE" "ubuntu_old" "Ubuntu Studio" "ubuntu_small" "Venom" "void_small" "Void" "Obarun" "Windows 10" "Windows"  "Xubuntu" "IRIX" "Zorin" "Darwin" "GNU" "Linux" "Profelis SambaBOX" "SunOS" "IRIX")   

# Select a random distro
random_distro=${distros[RANDOM % ${#distros[@]}]}

# Get the neofetch config directory
config_dir=~/.config/neofetch

# Check if the config directory exists
if [ ! -d "$config_dir" ]; then
    echo "Neofetch config directory not found."
    exit 1
fi

# Update the neofetch config file with the random distro
config_file="$config_dir/config.conf"
if [ -f "$config_file" ]; then
    awk -v distro="$random_distro" '/^ascii_distro/{sub(/".*"/, "\""distro"\"")}1' "$config_file" > "$config_file.tmp" && mv "$config_file.tmp" "$config_file"
else
    echo "Neofetch config file not found."
    exit 1
fi

# Run neofetch
neofetch
