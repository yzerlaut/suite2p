#!/usr/bin/env bash

# Install Conda
wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash ./miniconda.sh -b
export PATH=~/miniconda3/bin:$PATH
conda update --yes conda

# Go to project directory
cd /vagrant

# Install suite2p dependencies
conda env create -f environment.yml
source activate suite2p
pip install .[data,nwb]
dvc pull -r gdrive-travis
pip install coveralls
