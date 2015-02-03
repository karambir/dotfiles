# My normal system setup

## normal apt-get install>>
+ build-essential
+ python-dev
+ python3-dev
+ ubuntu-restricted-extras (will display Microsoft fonts license)
+ vim-gtk
+ terminator
+ git
+ tree
+ curl
+ python-pip
+ ipython
+ gparted
+ nginx
+ postgresql-9.3
+ postgresql-server-dev-9.3
+ gnome-shell (make gdm default)
+ chromium-browser

## Disable nginx, postgres on startup
+ sudo update-rc.d -f nginx disable
+ sudo update-rc.d -f postgresql disable

## sudo pip install>>
+ virtualenvwrapper (it will install virtualenv also)
+ requests
+ youtube-dl (apt-get have old version, which does not play good with playlists)

## setup vim:
+ copy vimrc from dotfiles repo
+ remove all dir from .vim/bundle
+ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
+ run vim and do BundleInstall
+ copy wakatime key

## Setup SourceCodePro font
+ sudo mkdir -p /usr/share/fonts/opentype
+ sudo cp -r SourceCodePro_FontsOnly-1.017/OTF/* /usr/share/fonts/opentype/

## Setup themes and icons
+ sudo apt-add-repository ppa:numix/ppa
+ sudo add-apt-repository ppa:noobslab/themes
+ sudo add-apt-repository ppa:moka/stable
+ install >> moka-icon-theme moka-gtk-theme moka-gnome-shell-theme orchis-gtk-theme numix-gtk-theme numix-icon-theme unity-tweak-tool

+ sudo add-apt-repository ppa:noobslab/icons
+ install >> faience-icon-theme faenza-icon-theme

## External debs
+ Virtualbox (default virtualbox do not play well with default vagrant)
+ Vagrant
+ Skype
+ Heroku
+ Steam
+ Dropbox
