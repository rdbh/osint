#!/bin/bash
# Install script for Jupyter Labs + OSINT template
#copyright 2021 Richard Dawson

JUP_PATH=/usr/share/jupyter
if [ ! -d "$JUP_PATH/templates" ]; then
	echo "Creating templates directory at ${JUP_PATH}/templates"
	sudo mkdir -p $JUP_PATH/templates
	sudo chmod 755 $JUP_PATH/templates
else
	echo "Template directory exists at ${JUP_PATH}/templates"
fi
if [ ! -d "$JUP_PATH/tools" ]; then
	echo "Creating templates directory at ${JUP_PATH}/tools"
	sudo mkdir -p $JUP_PATH/tools
	sudo chmod 755 $JUP_PATH/tools
else
	echo "Template directory exists at ${JUP_PATH}/tools"
fi

# Install Jupyter Labs
pip3 install jupyterlab

# Install node.js
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# Just in case they aren't already installed
#sudo apt-get install gcc g++ make
sudo apt-get install -y nodejs

# Install and add templates
pip3 install jupyterlab_templates
jupyter labextension install jupyterlab_templates
jupyter serverextension enable --py jupyterlab_templates

#Tool Install

#Install GoLang
echo Installing GoLang!
sudo apt-get install golang-go -qq -y

cd $JUP_PATH/tools

#Install Subfinder
echo Installing Subfinder!
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sudo mkdir $JUP_PATH/tools/subfinder
sudo cp /root/go/bin/subfinder /root/Tools/subfinder/

#Install assetfinder
echo Installing assetfinder!
go get -u github.com/tomnomnom/assetfinder
sudo mkdir $JUP_PATH/tools/assetfinder
sudo cp /root/go/bin/assetfinder $JUP_PATH/tools/assetfinder/
cp /root/go/bin/assetfinder /usr/local/bin/

#Install dnsprobe
echo Installing dnsprobe!
go get -u github.com/projectdiscovery/dnsprobe
sudo mkdir $JUP_PATH/tools/dnsprobe
sudo cp /root/go/bin/dnsprobe $JUP_PATH/tools/dnsprobe/
cp /root/go/bin/dnsprobe /usr/local/bin/

#Install Infoga
echo Installing Infoga!
sudo git clone https://github.com/m4ll0k/Infoga.git $JUP_PATH/tools/Infoga -q
python3 $JUP_PATH/tools/Infoga/setup.py install

#Install ShodanScraper
#Need to initialize Shodan API Key!
echo Installing ShodanScraper!

sudo git clone https://github.com/ariel-shin/Recon-Scripts/blob/master/shodanScraper.py $JUP_PATH/tools/shodanScraper
sudo chmod +x $JUP_PATH/tools/shodanScraper/shodanScraper.py
python3 -m easy_install shodan

#Install CloudEnum
echo Installing CloudEnum!
sudo git clone https://github.com/initstring/cloud_enum.git $JUP_PATH/tools/cloud_enum -q
pip3 install -r $JUP_PATH/tools/cloud_enum/requirements.txt -q

#Install GitDorker
echo Installing GitDorker
git clone https://github.com/obheda12/GitDorker $JUP_PATH/tools/GitDorker -q
pip3 install -r $JUP_PATH/tools/GitDorker/requirements.txt -q
rm $JUP_PATH/tools/GitDorker/*png

mkdir ~/.jupyter/ssl
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=COUNTRY/ST=STATE/L=CITY/O=ORGANIZATION/CN=CNAME" -keyout ~/.jupyter/ssl/mykey.key -out ~/.jupyter/ssl/mycert.pem
screen -dmS notebook jupyter-notebook --allow-root --notebook-dir ~/.jupyter

# Download and copy template to templates folder

cp jupyter_OSINT.ipynb /usr/share/jupyter/notebook_templates