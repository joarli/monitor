#!/usr/bin/env bash

# OS VERSION: Ubuntu Server
# ARCH: x32_64

INSTALL=1.0

# Official Init Net Client Monitor Automated Installation Script
# =============================================
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

# First we check if the user is 'root' before allowing installation to commence
if [ $UID -ne 0 ]; then
    echo "Erro! para iniciar a instalação você precisa estar logado como 'root'. Faça o login como root e inicie o script novamente."
    exit 1
fi

# Lets check for some common control panels that we know will affect the installation/operating of ZPanel.
#if [ -e /usr/local/cpanel ] || [ -e /usr/local/directadmin ] || [ -e /usr/local/solusvm/www ] || [ -e /usr/local/home/admispconfig ] || [ -e /usr/local/lxlabs/kloxo ] ; then
#    echo "You appear to have a control panel already installed on your server; This installer"
#    echo "is designed to install and configure ZPanel on a clean OS installation only!"
#    echo ""
#    echo "Please re-install your OS before attempting to install using this script."
#    exit
#fi

# Lets check for some common packages that we know will affect the installation/operating of ZPanel.
# We expect a clean OS so no apache/mySQL/bind/postfix/php!
#if dpkg -l | grep mysql; then
#    echo "You appear to have a server with apache/mysql/bind/postfix already installed; "
#    echo "This installer is designed to install and configure ZPanel on a clean OS "
#    echo "installation only!"
#    echo ""
#    echo "Please re-install your OS before attempting to install using this script."
#    exit
#fi
# Ensure the installer is launched and can only be launched on Ubuntu 12.04
BITS=$(uname -m | sed 's/x86_//;s/i[3-6]86/32/')
if [ -f /etc/lsb-release ]; then
  OS=$(cat /etc/lsb-release | grep DISTRIB_ID | sed 's/^.*=//')
  VER=$(cat /etc/lsb-release | grep DISTRIB_RELEASE | sed 's/^.*=//')
else
  OS=$(uname -s)
  VER=$(uname -r)
fi
