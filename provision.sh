#!/usr/bin/env bash
# A provisioning script to get the latest smith & friends
# and to compile graphite from source 

export DEBIAN_FRONTEND=noninteractive

set -e -o pipefail

echo "Installing smith & friends (from the package repositories)"
echo " "


# this PPA is the production one
sudo add-apt-repository -s -y ppa:silnrsi/smith 

# the official fontforge PPA
sudo add-apt-repository -s -y ppa:fontforge/fontforge 

apt-get update -y  

sudo apt-get install -y smith fontforge 


echo "removing previous builds folder (if any)" 
echo " "

rm -rf ~/builds

echo "Creating builds folder"
echo " "

mkdir ~/builds
cd ~/builds


echo "Installing Graphite from source"
echo " "

sudo apt-get build-dep graphite2 -y 

git clone https://github.com/silnrsi/graphite.git

cd graphite
mkdir build
cd build
cmake ..
make
sudo make install 


echo " "
echo "Done!" 
echo "smith & friends are now ready to use:"
echo " "
echo "type \"vagrant ssh\" to log into the VM"
echo "type \"cd /vagrant\" to go to your shared work folder seen from smith and launch the smith commands"
echo " "




