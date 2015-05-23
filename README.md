Getting Started
===============
Clone this and initialize. Backups will be created in `$HOME/bak/configs`.

    git clone https://github.com/felixhummel/configs.git
    cd configs
    git submodule update --init
    ./init --email EMAIL --name "NAME" --force
    exec $SHELL

Email and name will be written to `~/.git/user` which is included by
`~/.gitconfig`.
