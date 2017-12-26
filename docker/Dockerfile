FROM centos:centos7
MAINTAINER morita <tatsuya.morita@bosco-tech.com>

# CMD:docker run する場合に実行される
CMD echo "this centos is for Development"

# 初期設定
RUN yum update -y
RUN yum -y install epel-release
RUN yum install -y sudo vim iproute unzip wget make git tmux tig curl zlib-devel gcc
RUN curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo 
RUN yum -y install neovim
RUN yum -y install readline-devel zlib-devel bzip2-devel sqlite-devel openssl-devel mariadb mariadb-server
RUN yum -y groupinstall "Development Tools"

# user設定
RUN useradd morita && echo 'morita:hoge' | chpasswd
RUN echo 'Defaults visiblepw' >> /etc/sudoers
RUN echo 'morita ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#user change
USER morita
WORKDIR /home/morita
ENV HOME /home/morita

# pyenv virtualenv:w
RUN git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shim:$PYENV_ROOT/bin:$PATH
RUN git clone https://github.com/yyuu/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv
RUN echo 'eval "$(pyenv init -)"' >> $HOME/.bashrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> $HOME/.bashrc
RUN source $HOME/.bashrc
RUN exec $SHELL -l
RUN pyenv install 3.6.3
RUN pyenv virtualenv 3.6.3 main
RUN pyenv global main
RUN pyenv virtualenv 3.6.3 dev
RUN pyenv rehash

# neovim
RUN echo 'export XDG_CONFIG_HOME = "$HOME/.config"' >> $HOME/.bash_profile
RUN echo 'export XDG_CACHE_HOME = "$HOME/.cache"' >> $HOME/.bash_profile
RUN source $HOME/.bash_profile
RUN git clone https://github.com/tmorita-bsc/dotfiles.git
RUN sudo chmod +x $HOME/dotfiles/init_env.sh
RUN sudo sh $HOME/dotfiles/init_env.sh dein
RUN mkdir -p $HOME/.config
RUN mkdir -p $HOME/.config/nvim
RUN ln -sf $HOME/.vimrc $HOME/.config/nvim/init.vim
