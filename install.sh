#!/bin/bash
#install vim 8
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt  install vim

sudo apt-get -y update
sudo apt-get -y install git-core
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [  -f ~/.vimrc ]; then
		mv ~/.vimrc ~/.vimrc_copy
fi
cp vimrc_u16 ~/.vimrc
cp ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
vim +PluginInstall +qall
cp -R after ~/.vim/after/
cp -R plugin ~/.vim/plugin/
cp -R macros ~/.vim/macros/ 


#install powerline font
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

#sudo apt-get -y install fonts-powerline

 sudo apt-get -y install xclip.  
 sudo apt-get -y install exuberant-ctags
 sudo aptget -y install cscope

 #change caps and escape
 sudo apt-get -y install dconf-tools
 dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:swapescape']"

#install chrome 
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main"  | sudo tee --append /etc/apt/sources.list
wget https://dl.google.com/linux/linux_signing_key.pub 
sudo apt-key add linux_signing_key.pub
sudo apt update
sudo apt install google-chrome-stable

#install YCM

sudo apt-get -y install build-essential cmake
sudo apt-get -y install python-dev python3-dev

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
cd -

 # install double comd
sudo add-apt-repository ppa:alexx2000/doublecmd 
sudo apt-get update
sudo apt-get -y install doublecmd-gtk 

doublecmd
echo "Now copy doublecmd file"
sleep 5
if [  -f ~/.config/doublecmd/doublecmd.xml ]; then
		mv ~/.config/doublecmd/doublecmd.xml ~/.config/doublecmd/doublecmd_copy.xml 
fi 
cp doublecmd.xml ~/.config/doublecmd/doublecmd.xml


