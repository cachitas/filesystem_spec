#!/usr/bin/env bash
# Install conda
sudo apt-get update && sudo apt-get install libxss1  # squash gcc imcompat
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"
conda config --set always_yes yes --set changeps1 no
conda update conda

# Install dependencies
conda create -n test -c conda-forge python=3.7 pip pytest=4.5 paramiko requests dask distributed
source activate test
pip install . --no-deps
