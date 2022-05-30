#!/bin/bash




#############################################################
#               L3MON Installer for texmux                  #
#               costom apk builder without java 8           #
#               made by Dhananjay sah (Efx-Tv)              #
#############################################################





#############################################################
# Colors
#############################################################


clear='\033[0m'          # Clear
Red='\033[0;91m'         # Red
Green='\033[0;92m'       # Green
Purple='\033[0;95m'      # Purple
Cyan='\033[0;96m'        # Cyan


#############################################################
# pv install for typer animation
#############################################################


pkg install pv > /dev/null 2>&1 
gem install lolcat > /dev/null 2>&1 



#############################################################
# nodejs
#############################################################
if [ -e $PREFIX/bin/node ]
then
	printf "${Green}[✓] nodejs Installed\n" | pv -qL 30
else
	printf "${Red}[✘] nodejs not Installed\n" | pv -qL 30 
	printf "${Cyan}[☢] nodejs Installing...${clear}\n" | pv -qL 30
	pkg install nodejs -y 
	printf "${Green}[✓] nodejs Installed Sucessful\n" | pv -qL 30

fi



#############################################################
# apktool
#############################################################

if [ -e $PREFIX/bin/apktool ]
then
	printf "${Green}[✓] apktool Installed\n" | pv -qL 30
else
	printf "${Red}[✘] apktool not Installed\n" | pv -qL 30
	printf "${Cyan}[☢] apktool  Installing...${clear}\n" | pv -qL 30
	curl https://raw.githubusercontent.com/rendiix/rendiix.github.io/master/install-repo.sh -s| bash > /dev/null 2>&1
	pkg install zipalign -y
	pkg install apktool -y
	printf "${Green}[✓] apktool Installed Sucessful\n" | pv -qL 30
fi


#############################################################
# Php
#############################################################

if [ -e $PREFIX/bin/php ]
then
	printf "${Green}[✓] php Installed\n" | pv -qL 30
else
	printf " ${Red}[✘] php not Installed\n" | pv -qL 30
	printf " ${Cyan}[☢] php Installing...${clear}\n" | pv -qL 30
	pkg install php -y
	printf "${Green}[✓] php Installed Sucessful\n" | pv -qL 30
fi

#############################################################
# Extract lemon files in our file system
#############################################################

printf "${Purple}[☣] Extracting L3MON...${clear}\n " | pv -qL 30

mv L3MON/lemon  $PREFIX/bin
mv L3MON  $PREFIX/share
chmod +x $PREFIX/bin/lemon
cd $PREFIX/share/L3MON/server
npm install -g npm@6.14.10
npm install pm2 -g
npm install
printf "${Green}[✓] L3MON Installed Sucessful${clear}\n" | pv -qL 30


#############################################################
######################### The End  ##########################
#############################################################


