#!/bin/bash

#Before installing on Nano need to increase memory. Can use swapfile to virtually increase.
#Run these commands to add swap file

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <Install Folder>"
    exit
fi
folder="$1"

echo "** Install requirement"
sudo apt-get update
sudo apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y python2.7-dev python3.6-dev python-dev python-numpy python3-numpy
sudo apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
sudo apt-get install -y libv4l-dev v4l-utils qv4l2 v4l2ucp
sudo apt-get install -y curl
sudo apt install -y python3-pip
sudo apt-get update

echo "** Download opencv-4.1.0"
cd $folder
wget https://github.com/opencv/opencv/archive/4.1.0.zip -O opencv-4.1.0.zip
wget https://github.com/opencv/opencv_contrib/archive/4.1.0.zip -O opencv-contrib-4.1.0.zip
unzip opencv-4.1.0.zip 
unzip opencv-contrib-4.1.0.zip 
cd opencv-4.1.0/

echo "** Building make install..."
mkdir release
cd release/
cmake -D WITH_CUDA=ON -D CUDA_ARCH_BIN="5.3" -D CUDA_ARCH_PTX="" -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.1.0/modules -D WITH_GSTREAMER=ON -D WITH_LIBV4L=ON -D BUILD_opencv_python2=ON -D BUILD_opencv_python3=ON -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j3
sudo make install
sudo apt-get install -y python-opencv python3-opencv
sudo apt-get install -y libjpeg-dev
sudo pip3 install --user pillow

echo "** Installation opencv-4.1.0 complete"


