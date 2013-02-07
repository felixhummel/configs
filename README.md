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
Latest stable from source

    wget -O - https://raw.github.com/felixhummel/x/master/git_from_source.sh | bash

or via apt

    sudo apt-get install git
