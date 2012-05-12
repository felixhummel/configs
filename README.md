Getting Started
===============
Clone this and initialize. Backups will be created in `$HOME/bak/configs`.

    git clone git://github.com/felixhummel/configs.git
    cd configs
    git submodule update --init
    ./init --force
    source $HOME/.bashrc

Installing Git
==============

    sudo apt-get build-dep git-core
    latest_git_version=$(curl -s http://git-scm.com/ | grep "class='version'" | perl -pe 's/.*?(\d+\.\d+\.\d+\.\d+)<.*/$1/')
    echo $latest_git_version 
    cd /tmp
    wget http://git-core.googlecode.com/files/git-${latest_git_version}.tar.gz
    tar xzf git-${latest_git_version}.tar.gz
    cd git-${latest_git_version}
    ./configure && make && sudo make install

