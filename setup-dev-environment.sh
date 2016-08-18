# Generate a ssh key.
ssh-keygen -t rsa -b 4096 -C "chrischoy@ai.stanford.edu"

# Neovim vim-plug install
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Link vimrc
ln config/.nvimrc ~/.config/nvim/init.vim
ln config/.nvimrc ~/.nvimrc  # simpler path to find the file quickly
ln config/.tmux.conf ~/.tmux.conf  
ln config/.gitconfig ~/.gitconfig

# Set up my profile
git config --global user.email $1
git config --global user.name $2

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Download my custom theme
mkdir $ZSH_CUSTOM/themes
curl -fsSL -o $ZSH_CUSTOM/themes/capri7.zsh-theme https://gist.githubusercontent.com/chrischoy/a1a4f3e9468efd61a4ff4e3f67c945c5/raw/capri7.zsh-theme

# Powerline fonts
# Once installed, manually set the terminal font to be one of the powerline fonts
git clone https://github.com/powerline/fonts
sh fonts/install.sh

# Follow the steps in the URL[1] to remove the show desktop icon
# [1] http://askubuntu.com/questions/167263/how-can-i-remove-show-desktop-from-the-alt-tab-application-switcher

# Diable mouse acceleration
xset m 0 0 &
