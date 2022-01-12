sudo apt-get update
sudo apt-get -y dist-upgrade
sudo snap refresh
mkdir ~/Documents/Programs
sudo -H python3 -m pip install pip -U
sudo -H python3 -m pip install youtube-dl -U
sudo -H python3 -m pip install youtube-tool -U
sudo -H python3 -m pip install instalooter -U
sudo -H python3 -m pip install Instaloader -U
sudo -H python3 -m pip install nested-lookup -U
sudo -H python3 -m pip install pipenv -U
sudo -H python3 -m pip install webscreenshot -U
sudo -H python3 -m pip install internetarchive -U
sudo -H python3 -m pip install waybackpy -U
sudo -H python3 -m pip install socialscan -U
sudo -H python3 -m pip install holehe -U
sudo -H python3 -m pip install redditsfinder -U
sudo -H python3 -m pip install streamlink -U
cd ~/Downloads/Programs
git clone https://github.com/ChrisTruncer/EyeWitness.git
cd ~/Downloads/Programs/EyeWitness
cd Python/setup
sudo -H ./setup.sh
cd ~/Downloads/Programs
git clone https://github.com/aboul3la/Sublist3r.git
cd ~/Downloads/Programs/Sublist3r
sudo -H python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/s0md3v/Photon.git
cd ~/Downloads/Programs/Photon
sudo sudo -H python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/laramies/theHarvester.git
cd ~/Downloads/Programs/theHarvester
sudo -H python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/sherlock-project/sherlock.git
cd ~/Downloads/Programs/sherlock
sudo -H python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/WebBreacher/WhatsMyName.git
cd ~/Downloads/Programs/WhatsMyName
sudo -H python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/opsdisk/metagoofil.git
cd ~/Downloads/Programs/metagoofil
sudo -H python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/lanmaster53/recon-ng.git
cd ~/Downloads/Programs/recon-ng
sudo -H python3 -m pip install -r REQUIREMENTS

cd ~/Downloads/Programs
git clone https://github.com/smicallef/spiderfoot.git
cd ~/Downloads/Programs/spiderfoot
sudo -H python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/AmIJesse/Elasticsearch-Crawler.git

cd ~/Downloads/Programs
git clone https://github.com/aliparlakci/bulk-downloader-for-reddit.git
cd ~/Downloads/Programs/bulk-downloader-for-reddit
sudo -H python3 -m pip install -r requirements.txt
sudo apt autoremove -y
echo
echo Installation Complete!
echo
read -p "Press any key to continue or CTRL-C to abort"
