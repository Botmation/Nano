# Nano
These are install scripts and commands to help install openCV 4.1 on the jetson nano with contrib library. This will also install the extras you need for features like facial recognition.

Check out https://create.botmation.net/p/this-is-quick-guide-to-get-you-started.html
for detailed instructions and my you tube video.

#Before installing openCV 4.1 on Nano, will need to increase memory. Can use swapfile to virtually increase.
#Run these commands to add swap file

sudo fallocate -l 4.0G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

#Also, to make the swapfile activated during reboot, edit /etc/fstab:
sudo vim /etc/fstab

#And add the following line:
/swapfile none swap 0 0
