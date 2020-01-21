# Getting Started
Clone this and initialize. Backups will be created in `$HOME/bak/configs`.
```
cd $HOME
git clone https://github.com/felixhummel/configs.git
cd configs
./init --force
./pluginstall
exec $SHELL
```

Want to initialize `git`?
```
./init --force --email EMAIL --name "NAME"
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

# Absolute Essentials
Don't want/need all the configs on a box? Here's the bare minimum:
```
curl https://raw.githubusercontent.com/felixhummel/configs/master/readline/inputrc > ~/.inputrc

cat <<EOF >> ~/.vimrc
set mouse=
EOF

exec $SHELL

```
