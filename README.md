Getting Started
===============
Clone this and initialize. Backups will be created in `$HOME/bak/configs`.
```
cd $HOME
git clone https://github.com/felixhummel/configs.git
cd configs
./init --email EMAIL --name "NAME" --force
./pluginstall
exec $SHELL
```

Email and name will be written to `~/.gitconfig.d/user` which is included by
`~/.gitconfig`.

Missing git?
```
apt-get update && apt-get --yes install git
```

tmux plugins (via TPM)
```
git submodule update --init
```
