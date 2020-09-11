# update driver
sudo apt-get purge 'nvidia*'
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get update
sudo ubuntu-drivers autoinstall

bash "./Anaconda3-2020.02-Linux-x86_64.sh"