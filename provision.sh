#!/usr/bin/env bash
echo "Installing command and setting it up..."
apt-get update >/dev/null 2>&1
apt-get install -y git vim curl >/dev/null 2>&1
apt-get install -y python3-pip python3-pandas python3-pandas-lib ipython3 ipython3-notebook >/dev/null 2>&1
#apt-get install build-essential >/dev/null 2>&1

apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev libpng-dev
git clone git://github.com/yyuu/pyenv.git ~/.pyenv
git clone https://github.com/yyuu/pyenv-pip-rehash.git ~/.pyenv/plugins/pyenv-pip-rehash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
source ~/.bashrc
echo install anaconda
pyenv install anaconda3-5.2.0
pyenv global anaconda3-5.2.0

jupyter notebook --generate-config
sed -e "s/#c.NotebookApp.ip = 'localhost'/c.NotebookApp.ip = '0.0.0.0'/" ~/.jupyter/jupyter_notebook_config.py
