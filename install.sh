# Linux OSINT setup
# v2.0.0
# Currently building for Ubuntu or Kali - others by request
# (C) 2022 Richard Dawson

# Configuration Variables
BIN_PATH=$HOME/Downloads/Programs
DOC_PATH=$HOME/Documents/Osint
JUP_PATH=/usr/share/jupyter

# Install functions for non-repository tools
install_carbon14 () {
cd $BIN_PATH
git pull https://github.com/rdbh/Carbon14.git
cd ~/Downloads/Programs/Carbon14
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/Carbon14
}

install_elasticsearch () {
cd $BIN_PATH
git clone https://github.com/AmIJesse/Elasticsearch-Crawler.git
mkdir -p $DOC_PATH/Elasticsearch
}

install_eyewitness () {
cd $BIN_PATH
git clone https://github.com/rdbh/EyeWitness.git
cd ~/Downloads/Programs/EyeWitness
cd Python/setup
sudo -H ./setup.sh
mkdir -p $DOC_PATH/EyeWitness
}

install_osintgram () {
cd $BIN_PATH
git clone https://github.com/rdbh/Osintgram.git
cd ~/Downloads/Programs/Osintgram
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/osintgram
}

install_photon () {
cd $BIN_PATH
git pull https://github.com/rdbh/Photon.git
cd ~/Downloads/Programs/Photon
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/Photon
}

install_recon_ng () {
cd $BIN_PATH
git clone https://github.com/lanmaster53/recon-ng.git
cd ~/Downloads/Programs/recon-ng
python3 -m pip install -r REQUIREMENTS
mkdir -p $DOC_PATH/recon-ng
}

install_reddit_downloader () {
cd $BIN_PATH
git clone https://github.com/rdbh/bulk-downloader-for-reddit.git
cd ~/Downloads/Programs/bulk-downloader-for-reddit
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/reddit-downloader
}

install_sublist3r (){
cd $BIN_PATH
git clone https://github.com/rdbh/Sublist3r.git
cd ~/Downloads/Programs/Sublist3r
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/Sublist3r
}

install_sherlock () {
cd $BIN_PATH
git clone https://github.com/sherlock-project/sherlock.git
cd ~/Downloads/Programs/sherlock
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/sherlock
}

install_theharvester () {
cd $BIN_PATH
git clone https://github.com/rdbh/theHarvester.git
cd ~/Downloads/Programs/theHarvester
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/theHarvester
}

install_whatsmyname () {
cd $BIN_PATH
git clone https://github.com/WebBreacher/WhatsMyName.git
cd ~/Downloads/Programs/WhatsMyName
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/WhatsMyName
}

python_install () {
# Used to install python tools in the tools directory
cd $BIN_PATH
mkdir $1
cd ${1}
python3 -m pip install "${1}" -U
}

# Get OS distribution
if [[ "${1}" == "Kali" ]]; then 
  OS_NAME="Kali"
elif [[ "${1}" == "Ubuntu" ]]; then
  OS_NAME="Ubuntu"
else
  OS_NAME=$(lsb_release -a | grep '^Distributor' | cut -c 17-)
fi

echo "Installing for ${OS_NAME}"
read -n1 -p "Press Q to quit or [Enter] to continue" INSTALL_Q
if [[ "${INSTALL_Q}" == 'Q' ]] || [[ "${INSTALL_Q}" == 'q' ]];then
  echo "Quitting Script"
  exit 5
fi

# Create config file
touch ~/osint.config
echo DOC_PATH=$DOC_PATH >> osint.config
echo BIN_PATH=$BIN_PATH >> osint.config
echo JUP_PATH=$JUP_PATH >> osint.config

# Bring OS up to date
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt -y --fix-broken install
sudo snap refresh

# Add local installations to path
PATH=$HOME/.local/bin:$PATH
echo export PATH=$HOME/.local/bin:'$PATH' >> ~/.bashrc
echo export PATH=$HOME/.local/bin:'$PATH' >> ~/.zshenv
hash -r

# Python installation and package management 
sudo apt-get -y install python3-pip
sudo apt-get -y install pipenv

case $OS_NAME in
  Kali)
  # Kali Distro installations
    sudo apt-get -y install kali-tools-information-gathering

    # Tools in Kali repository  
    sudo apt-get -y install instaloader
    sudo apt-get -y install internetarchive
    sudo apt-get -y install photon
    sudo apt-get -y install sherlock
    sudo apt-get -y install spiderfoot
    sudo apt-get -y install youtube-dl
  
    #non-repository tools
    install_carbon14
	install_elasticsearch
	install_reddit_downloader
    
	# Python tools
	python_install holehe
	python_install instalooter
    ;;
  Ubuntu)
    #non-repository tools
    install_carbon14
	install_elasticsearch
	install_reddit_downloader
	
	# Python tools
	python_install holehe
	python_install instalooter
	python_install internetarchive
	;;
  *)
    echo "Unrecognized OS: ${OS_NAME}"
	;;
esac
	
# Create output directories
mkdir -p $DOC_PATH/gallery-dl
mkdir -p $DOC_PATH/instalooter
mkdir -p $DOC_PATH/metagoofil
mkdir -p $DOC_PATH/reddit
mkdir -p $DOC_PATH/waybackpy

# Python PyPi installations
python3 -m pip install nested-lookup -U
python3 -m pip install redditsfinder -U
python3 -m pip install socialscan -U
python3 -m pip install streamlink -U
python3 -m pip install waybackpy -U
python3 -m pip install webscreenshot -U
python3 -m pip install youtube-tool -U

cd ~/Documents/osint
sudo chmod 755 *.sh

sudo apt-get -y autoremove
sudo apt-get -y clean

echo
echo Installation Complete!
echo
echo "Jupyter notebook will start next"
read -p "Press [Enter] to continue or CTRL-C to abort" THROWAWAY

~/Documents/osint/jupyter.sh
