# Common installations
sudo apt-get install build-essential
sudo apt-get install cmake git
sudo apt-get install -y python-software-properties software-properties-common
sudo apt-get install exuberant-ctags zsh tig htop
sudo apt-get install dconf-tools

# Python
# User should choose which python packages to install through pip vs. apt-get
# sudo apt-get install python-dev python-pip python3-dev python3-pip
# sudo apt-get install python-pip python3-pip
# sudo apt-get install ipython
# sudo apt-get install python-ipdb

# For screen highlight
# http://askubuntu.com/questions/665155/how-to-highlight-current-screen-or-window
sudo apt-get install wmctrl

# Add PPAs
sudo add-apt-repository ppa:webupd8team/y-ppa-manager  # ppa-manager
sudo add-apt-repository ppa:neovim-ppa/unstable  # Neovim
sudo add-apt-repository ppa:byobu/ppa  # tmux
sudo apt-add-repository ppa:izx/askubuntu -y  # CompizConfig manager
sudo apt-get update

# Install neovim, tmux, GUI ppa-manager
sudo apt-get install y-ppa-manager
sudo apt-get install neovim
sudo apt-get install tmux=2.1-3build1~trusty
sudo apt-get install unit  # CompizConfig manager

# Install python support for neovim
# See https://neovim.io/doc/user/provider.html#provider-python
sudo pip install neovim
sudo pip3 install neovim  # for python3 plugins
sudo pip install flake8 pylint autopep8  # python lint checker

# Install python packages
sudo pip install grip  # Markdown renderer
sudo pip install yapf  # python formatter
