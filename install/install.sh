# Kali OSINT setup
# v1.0.2
# (C) 2022 Richard Dawson
DOC_PATH=$HOME/Documents/Osint
BIN_PATH=$HOME/Downloads/Programs

sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt -y --fix-broken install
sudo snap refresh

# Add local istallations to path
PATH=$HOME/.local/bin:$PATH
echo PATH=$HOME/.local/bin:$PATH >> ~/.zshenv

# Python installation and package management 
sudo apt-get -y install python3-pip
sudo apt-get -y install pipenv

# Kali Distro installations
sudo apt-get -y install kali-tools-information-gathering
sudo apt-get -y install instaloader
sudo apt-get -y install spiderfoot
sudo apt-get -y install photon
sudo apt-get -y install youtube-dl
sudo apt-get -y install internetarchive

# Python PyPi installations
mkdir ~/Downloads/Programs
python3 -m pip install youtube-tool -U
python3 -m pip install instalooter -U
python3 -m pip install nested-lookup -U
python3 -m pip install webscreenshot -U
python3 -m pip install internetarchive -U
python3 -m pip install waybackpy -U
python3 -m pip install socialscan -U
python3 -m pip install holehe -U
python3 -m pip install redditsfinder -U
python3 -m pip install streamlink -U

# Not Kali applications
cd $BIN_PATH
git pull https://github.com/rdbh/Photon.git
cd ~/Downloads/Programs/Photon
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/Photon

cd $BIN_PATH
git clone https://github.com/rdbh/EyeWitness.git
cd ~/Downloads/Programs/EyeWitness
cd Python/setup
sudo -H ./setup.sh
mkdir -p $DOC_PATH/EyeWitness

cd $BIN_PATH
git clone https://github.com/rdbh/Sublist3r.git
cd ~/Downloads/Programs/Sublist3r
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/Sublist3r

cd $BIN_PATH
git clone https://github.com/laramies/theHarvester.git
cd ~/Downloads/Programs/theHarvester
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/theHarvester

cd $BIN_PATH
git clone https://github.com/sherlock-project/sherlock.git
cd ~/Downloads/Programs/sherlock
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/sherlock

cd $BIN_PATH
git clone https://github.com/WebBreacher/WhatsMyName.git
cd ~/Downloads/Programs/WhatsMyName
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/WhatsMyName

cd $BIN_PATH
git clone https://github.com/lanmaster53/recon-ng.git
cd ~/Downloads/Programs/recon-ng
python3 -m pip install -r REQUIREMENTS
mkdir -p $DOC_PATH/recon-ng

cd $BIN_PATH
git clone https://github.com/AmIJesse/Elasticsearch-Crawler.git
mkdir -p $DOC_PATH/Elasticsearch

cd $BIN_PATH
git clone https://github.com/aliparlakci/bulk-downloader-for-reddit.git
cd ~/Downloads/Programs/bulk-downloader-for-reddit
python3 -m pip install -r requirements.txt
mkdir -p $DOC_PATH/reddit-downloader

cd ~/Documents/osint
sudo chmod 755 *.sh

sudo apt-get -y autoremove
sudo apt-get -y clean

echo
echo Installation Complete!
echo
echo "Jupyter notebook will start next"
echo "Press [Enter] to continue or CTRL-C to abort" 
read THROWAWAY

~/Documents/osint/jupyter.sh
