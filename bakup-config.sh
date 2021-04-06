#!/bin/bash
HomeDir="/home/zero" # Replace USER_NAME with your username.

Filename="$bakupconfig.tar"

cd $HomeDir ||
    exit 1

# dpkg --get-selections > .packages       # List of installed applications

# /usr/local
# The -c option here creates the tarball, so if you are to comment this out, 
# you need to replace the next -r with -c
tar -cvpf "$Filename" /usr/local/

# sudo
tar -rvpf "$Filename" /etc/sudoers            # this is what requires sudo. Comment out to run without sudo

# GRUB
tar -rvpf "$Filename" /etc/default/grub -     # Basic configs for the bootloader
tar -rvpf "$Filename" /etc/grub.d/ -          # scripts read during update grub
tar -rvpf "$Filename" /usr/share/grub/themes/ # GRUB Themes 

# /boot/grub2/grub.cfg  # for GRUB2

# Networking
tar -rvpf "$Filename" /etc/hosts
tar -rvpf "$Filename" /etc/resolv.conf        # contains a list of domain name servers used by the local machine
tar -rvpf "$Filename" /etc/hostname           # stores the name of the host computer

# Kernel
tar -rvpf "$Filename" /usr/src/linux/.config  # the kernel's config file that is used to compile

# Kernel Modules
tar -rvpf "$Filename" /etc/modules.conf
tar -rvpf "$Filename" /etc/modprobe.conf
tar -rvpf "$Filename" /etc/modprobe.d/modprobe.conf
tar -rvpf "$Filename" /etc/modules-load.d     # for Arch/Manjaro

# cron
tar -rvpf "$Filename" /etc/crontab            # shell script to run different commands periodically
tar -rvpf "$Filename" /etc/cron.deny          # deny user the ability run crontab
tar -rvpf "$Filename" /etc/cron.*

# syslog
# tar -rvpf "$Filename" /etc/syslog.conf      # syslogd
# tar -rvpf "$Filename" /etc/syslog-ng/syslog-ng.conf # syslog-ng

# udev
tar -rvpf "$Filename" /etc/udev/*             # udev config files
tar -rvpf "$Filename" /etc/dev.d/*            # programs invoked by udev
tar -rvpf "$Filename" /etc/udev/rules.d

# Shells
# Contains .config files for bash and sh only. Other shells to be added later
# bash
tar -rvpf "$Filename" /etc/bashrc
tar -rvpf "$Filename" /etc/bashrc
tar -rvpf "$Filename" /etc/bash/bashrc
tar -rvpf "$Filename" /etc/bash/bash*
tar -rvpf "$Filename" ~/.profile

# sh
tar -rvpf "$Filename" /etc/profile
tar -rvpf "$Filename" ~/.profile

@ csh
tar -rvpf "$Filename" /etc/cshrc
tar -rvpf "$Filename" ~/.login
tar -rvpf "$Filename" ~/.cshrc
tar -rvpf "$Filename" ~/.logout

# Display managers
# Contains only GNOME and KDE. Other DEs to be added later
# tar -rvpf "$Filename" /etc/gdm/gdm.conf             # GNOME
# tar -rvpf "$Filename" /usr/share/config/kdm/kdmrc   # KDE

# XDM
# Depeding on your distribution /etc may be replaced by /usr/lib or /usr/local/lib
# tar -rvpf "$Filename" /etc/X11/xdm*
# tar -rvpf "$Filename" /usr/X11R6/lib/X11/xdm # for SuSE 6.4
# tar -rvpf "$Filename" /etc/X11/X*access

# fstab
tar -rvpf "$Filename" /etc/fstab # links devices to mount points. Important if you have auto-mount scripts

# more etc
tar -rvpf "$Filename" /etc/default
tar -rvpf "$Filename" /etc/environment    # PATH backup
tar -rvpf "$Filename" /etc/profile
tar -rvpf "$Filename" /etc/profile.d
tar -rvpf "$Filename" /etc/man_db.conf
tar -rvpf "$Filename" /etc/init.d/       # directory for init scripts
tar -rvpf "$Filename" /etc/sysctl.d

# The following may not be on your system but are optional. Uncomment if necessary

# tar -rvpf "$Filename" /etc/rc.d/init.d/ # in case you have this
# tar -rvpf "$Filename" /etc/inittab # describes which processes are started at bootup
# tar -rvpf "$Filename" /etc/local.d/ # scripts run by "local" init script
# tar -rvpf "$Filename" /etc/sysctl.conf # configures the behaviour of the Linux kernel
# tar -rvpf "$Filename" /etc/rc.sysinit 

# GTK (Optional)
tar -rvpf "$Filename" /etc/gtk-2.0/gtkrc
tar -rvpf "$Filename" ~/.gtkrc-2.0
tar -rvpf "$Filename" ~/.gtkrc-2.0.mine                       # used when .gtkrc-2.0 is auto-generated, sourced from .gtkrc-2.0
tar -rvpf "$Filename" ~/.config/gtk-2.0/gtkfilechooser.ini    # options for file open/save chooser
tar -rvpf "$Filename" /etc/gtk-3.0/settings.ini

# $HOME config files
tar -rvpf "$Filename" ~/.bashrc
tar -rvpf "$Filename" ~/.bash_*

# find all $HOME/.config files and add to .tar
find .* -maxdepth 0 -type f -exec tar -rvf "$Filename" {} +


# [!DISTRO-SPECIFIC]
# The following code is distribution specific

# Red Hat/Fedora/SUSE
# Main config files directory
# tar -rvpf "$Filename" /etc/sysconfig/

# Package Managers
# tar -rvpf "$Filename" /etc/dnf/dnf.conf
# tar -rvpf "$Filename" /etc/yum.conf
# tar -rvpf "$Filename" /usr/lib/rpm/rpmrc
# tar -rvpf "$Filename" /usr/lib/rpm/redhat/rpmrc
# tar -rvpf "$Filename" /etc/rpmrc
# tar -rvpf "$Filename" ~/.rpmrc
# tar -rvpf "$Filename" /usr/lib/rpm/macros
# tar -rvpf "$Filename" /usr/lib/rpm/redhat/macros
# tar -rvpf "$Filename" /etc/rpm/macros
# tar -rvpf "$Filename" ~/.rpmmacros
# tar -rvpf "$Filename" /etc/sysconfig/rhn/sources

# Ubuntu/Mint
# Package Manager
# tar -rvpf "$Filename" /etc/apt/apt.conf
# tar -rvpf "$Filename" /etc/apt/apt.conf.d
# tar -rvpf "$Filename" /etc/apt/sources.list       # Sources for repositories
# tar -rvpf "$Filename" /etc/apt/sources.list.d
# tar -rvpf "$Filename" /etc/apt/trusted.gpg        # Trusted keys for 3rd Party PPAs
# tar -rvpf "$Filename" /etc/apt/trusted.gpg.d
# tar -rvpf "$Filename" /etc/apt/vendors.list
# tar -rvpf "$Filename" ~/.aptitude/config

# Gentoo
# Main config files
# tar -rvpf "$Filename" /etc/conf.d/*
# tar -rvpf "$Filename" /etc/env.d/*

# Package Manager
# tar -rvpf "$Filename" /etc/portage/package.keywords
# tar -rvpf "$Filename" /etc/portage/package.unmask
# tar -rvpf "$Filename" /etc/portage/profile/package.provided
# tar -rvpf "$Filename" /etc/profile.env

# Arch/Manjaro
# Package Manager
# tar -rvpf "$Filename" /etc/pacman.conf
# tar -rvpf "$Filename" /etc/pacman.d/mirrorlist

# GTK (Optional)
tar -rvpf "$Filename" /etc/gtk-2.0/gtkrc
tar -rvpf "$Filename" ~/.gtkrc-2.0
tar -rvpf "$Filename" ~/.gtkrc-2.0.mine                    # used when .gtkrc-2.0 is auto-generated, sourced from .gtkrc-2.0
tar -rvpf "$Filename" ~/.config/gtk-2.0/gtkfilechooser.ini # options for file open/save chooser
tar -rvpf "$Filename" /etc/gtk-3.0/settings.ini

# Web Browser Profiles
tar -rvpf "$Filename" ~/.mozilla/firefox              # Firefox
tar -rvpf "$Filename" ~/.config/google-chrome/default # Google Chrome
tar -rvpf "$Filename" ~/.config/opera*                # Opera

echo "Compiling file list with file sizes..."
tar -tvf "$Filename" > BakupLog    # list of files and their sizes
chmod a+w BakupLog                 # grants delete permissions

echo "Compressing archive..."
gzip "$Filename"
Filename="$Filename.gz"

# Move the backup once completed
# mkdir -p ./home/USER_NAME/; mv bakupconfig.tar $_

echo "Done!"

exit 0
