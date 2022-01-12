#!/bin/bash
#copyright 2021 Richard Dawson

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