sudo awk '/VendorName     \"NVIDIA Corporation\"/{print;print "    BusID          \"0:3:0\"";next}1' /etc/X11/xorg.conf > tmp && \
sudo mv tmp /etc/X11/xorg.conf
sudo awk '/DefaultDepth    24/{print;print "    Option        \"UseDisplayDevice\" \"none\"";next}1' /etc/X11/xorg.conf > tmp && \
sudo mv tmp /etc/X11/xorg.conf

cd
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
sudo apt-get update
sudo apt-get install cuda -y


echo 'export PATH=/usr/local/cuda-8.0/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc

sudo apt-get dist-upgrade -y

cd

wget https://s3.amazonaws.com/blottostuff/cudnn-8.0-linux-x64-v7.1.tgz

tar -xzf cudnn-8.0-linux-x64-v7.1.tgz
cd cuda
sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/* /usr/local/cuda/include/

sudo reboot
