#cd ~/
#git clone https://github.com/tmorita-bsc/dotfiles.git

yum update -y
yum install -y epel-release
yum install -y gcc make wget git tmux tree vim
curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
yum install -y neovim
yum -y install readline-devel zlib-devel bzip2-devel sqlite-devel openssl-devel
yum -y groupinstall "Development Tools"

git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv

echo "export PYENV_ROOT=$HOME/.pyenv" >> ~/.bashrc
echo "export PATH=$PYENV_ROOT/bin:$PATH" >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
source ~/.bashrc

pyenv install 3.6.3
pyenv virtualenv 3.6.3 main
pyenv global 3.6.3

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
