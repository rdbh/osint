sudo apt-get update
sudo apt-get -y dist-upgrade
sudo snap refresh
mkdir ~/Downloads/Programs
python3 -m pip install pip -U
python3 -m pip install youtube-dl -U
python3 -m pip install youtube-tool -U
python3 -m pip install instalooter -U
python3 -m pip install Instaloader -U
python3 -m pip install nested-lookup -U
python3 -m pip install pipenv -U
python3 -m pip install webscreenshot -U
python3 -m pip install internetarchive -U
python3 -m pip install waybackpy -U
python3 -m pip install socialscan -U
python3 -m pip install holehe -U
python3 -m pip install redditsfinder -U
python3 -m pip install streamlink -U
cd ~/Downloads/Programs
git clone https://github.com/ChrisTruncer/EyeWitness.git
cd ~/Downloads/Programs/EyeWitness
cd Python/setup
sudo -H ./setup.sh
cd ~/Downloads/Programs
git clone https://github.com/aboul3la/Sublist3r.git
cd ~/Downloads/Programs/Sublist3r
python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/s0md3v/Photon.git
cd ~/Downloads/Programs/Photon
python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/laramies/theHarvester.git
cd ~/Downloads/Programs/theHarvester
python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/sherlock-project/sherlock.git
cd ~/Downloads/Programs/sherlock
python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/WebBreacher/WhatsMyName.git
cd ~/Downloads/Programs/WhatsMyName
python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/opsdisk/metagoofil.git
cd ~/Downloads/Programs/metagoofil
python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/lanmaster53/recon-ng.git
cd ~/Downloads/Programs/recon-ng
python3 -m pip install -r REQUIREMENTS

cd ~/Downloads/Programs
git clone https://github.com/smicallef/spiderfoot.git
cd ~/Downloads/Programs/spiderfoot
python3 -m pip install -r requirements.txt

cd ~/Downloads/Programs
git clone https://github.com/AmIJesse/Elasticsearch-Crawler.git

cd ~/Downloads/Programs
git clone https://github.com/aliparlakci/bulk-downloader-for-reddit.git
cd ~/Downloads/Programs/bulk-downloader-for-reddit
python3 -m pip install -r requirements.txt

sudo apt-get -y autoremove
sudo apt-get -y clean

echo
echo Installation Complete!
echo
read -p "Press any key to continue or CTRL-C to abort"
