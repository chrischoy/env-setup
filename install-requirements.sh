# Common installations
sudo apt-get install -y python-software-properties software-properties-common
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo apt-get install exuberant-ctags zsh tig

# Add PPAs
sudo add-apt-repository ppa:webupd8team/y-ppa-manager  # ppa-manager
sudo add-apt-repository ppa:neovim-ppa/unstable  # Neovim
sudo add-apt-repository ppa:byobu/ppa # tmux
sudo apt-get update

# Install neovim, tmux, GUI ppa-manager
sudo apt-get install y-ppa-manager
sudo apt-get install neovim
sudo apt-get install tmux=2.1-3build1~trusty
