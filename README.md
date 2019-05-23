# Getting Started
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

# Absolute Essentials
Don't want/need all the configs on a box? Here's the bare minimum:
```
cat <<'EOF' >> ~/.bashrc
# check if bind can be run without error
[[ $(bind 2>&1) == '' ]]
# apply bindings only if we have a terminal
if [[ $? == 0 ]]; then
  # ipython style history
  bind '"\e[A":history-search-backward'
  bind '"\e[B":history-search-forward'
fi
EOF

cat <<EOF >> ~/.vimrc
set mouse=
EOF
```
