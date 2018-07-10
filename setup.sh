#!/bin/bash

gcloud config set project dlcampjeju2018

gcloud config set compute/zone us-central1-f

gcloud compute instances create rl-vm \
	  --machine-type=n1-standard-1 \
	    --image-project=ml-images \
	      --image-family=tf-1-8 \
	        --scopes=cloud-platform



wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

sudo apt-get install xvfb
sudo apt-get install libav-tools
sudo apt-get install python-opengl

source ~/.bashrc
git clone https://github.com/RishabGargeya/rl-seminar1.git
cd rl-seminar

conda env create

source activate rl1

xvfb-run -s "-screen 0 1400x900x24" python cartpolev0.py
xvfb-run -s "-screen 0 1400x900x24" python cartpolev1.py
