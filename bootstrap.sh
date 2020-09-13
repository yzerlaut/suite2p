#!/usr/bin/env bash

# Install graphics drivers (pyqt5 compatibility)
sudo apt update
sudo apt install libgl1-mesa-glx


# Install Conda
wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash ./miniconda.sh -b
export PATH=~/miniconda3/bin:$PATH
echo "export PATH=~/miniconda3/bin:$PATH" >> ~/.bashrc

conda update --yes conda

# Go to project directory
cd /vagrant

# Install suite2p dependencies
conda env create -f environment.yml
source activate suite2p
echo "source activate suite2p" >> ~/.bashrc
pip install .[data,nwb]
dvc pull -r gdrive-travis
pip install coveralls
