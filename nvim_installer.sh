#cd ~/
#git clone https://github.com/tmorita-bsc/dotfiles.git

yum update -y
yum install -y epel-release
yum install -y gcc make wget git tmux tree vim
curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
yum install -y neovim
yum -y install readline-devel zlib-devel bzip2-devel sqlite-devel openssl-devel
yum -y groupinstall "Development Tools"

export HOME=/root
#export HOME=/home/user_name
git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
git clone https://github.com/yyuu/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv

echo "export PYENV_ROOT=$HOME/.pyenv" >> $HOME/.bashrc
echo "export PATH=$PYENV_ROOT/bin:$PATH" >> $HOME/.bashrc
echo 'eval "$(pyenv init -)"' >> $HOME/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.bashrc
source $HOME/.bashrc

pyenv install 3.6.3
pyenv virtualenv 3.6.3 main
pyenv global 3.6.3

echo 'export XDG_CONFIG_HOME = "$HOME/.config"' >> $HOME/.bash_profile
echo 'export XDG_CACHE_HOME = "$HOME/.cache"' >> $HOME/.bash_profile

cd init_env.sh
sudo sh init_env.sh dein

cd /tmp
wget http://tamacom.com/global/global-6.2.4.tar.gz
tar xfvz global-6.2.4.tar.gz
cd global-6.2.4
sudo ./configure
sudo make
sudo make install
ln -sf /usr/local/share/gtags/gtags.vim /usr/share/vim/vim74/plugin

source $HOME/.bash_profile
mkdir -p $HOME/.config
mkdir -p $HOME/.config/nvim
ln -sf $HOME/.vimrc $HOME/.config/nvim/init.vim
