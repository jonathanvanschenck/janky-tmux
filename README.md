# janky-tmux
A janky tmux configuration

## Setup
Install tmux -- we highly recommend >=3.3 to be fully featured. See below if your package manager is too far behind this
(I'm looking at you Ubuntu!)

Then install this repo:
```bash
git clone https://github.com/jonathanvanschenck/janky-tmux.git ~/.config/tmux
cd ~/.config/tmux && ./install.sh
```

## Parallel installations

You can clone the repo to multiple locations and run independent tmux servers — useful for isolating dev environments.

```bash
git clone https://github.com/jonathanvanschenck/janky-tmux.git ~/.config/tmux-jvs
cd ~/.config/tmux-jvs && ./install.sh
```

Then add a shell alias to launch a tmux session using that config:

```bash
tm() {
    tmux -L jvs-server -f ~/.config/tmux-jvs/tmux.conf "$@"
}
```

Each install gets its own `local.conf` (gitignored) for machine-specific tweaks.


## nvim in tmux
Depending on your config, you might need to force nvim to detect truecolor, you can do this by adding the following to your `~/.bashrc`
```
export COLORTERM=truecolor
```


## Installing tmux from source
```
# Deps
sudo apt install -y \
    build-essential \
    pkg-config \
    libevent-dev \
    libncurses5-dev \
    libncursesw5-dev \
    bison \
    byacc \
    autoconf \
    automake


cd /tmp
wget https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz
tar xzf tmux-3.5a.tar.gz
cd tmux-3.5a

./configure --prefix=/usr/local
make -j$(nproc)
sudo make install
```

Or for maximum isolation:
```
# Install build dependencies
sudo apt install -y \
    build-essential \
    pkg-config \
    libevent-dev \
    libncurses5-dev \
    libncursesw5-dev \
    bison \
    byacc \
    autoconf \
    automake

# Build and install tmux 3.5a into this repo's directory
cd /tmp
wget https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz
tar xzf tmux-3.5a.tar.gz
cd tmux-3.5a

./configure --prefix="$HOME/.config/tmux-jvs/dist"
make -j$(nproc)
make install
```

Then modify your alias
```
tm() {
    "$HOME/.config/tmux-jvs/dist/bin/tmux" \
        -L jvs-server \
        -f "$HOME/.config/tmux-jvs/tmux.conf" \
        "$@"
}
```
