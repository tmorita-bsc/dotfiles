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

WORKDIR /home/morita
USER morita

# pyenv virtualenv
RUN git clone https://github.com/yyuu/pyenv.git ~/.pyenv
ENV HOME /home/morita
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shim:$PYENV_ROOT/bin:$PATH
RUN git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
RUN source ~/.bashrc
RUN exec $SHELL -l
RUN pyenv install 3.6.3
RUN pyenv virtualenv 3.6.3 main
RUN pyenv global main
RUN pyenv virtualenv 3.6.3 dev
RUN pyenv rehash

#ADD info.py /home/morita/info.py
#
#ENTRYPOINT ["python"]
#CMD ["info.py"]

# neovim
RUN git clone https://github.com/tmorita-bsc/dotfiles.git
RUN sudo chmod +x ~/dotfiles/init_env.sh
RUN sudo sh ~/dotfiles/init_env.sh dein
