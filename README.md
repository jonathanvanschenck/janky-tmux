# janky-tmux
A janky tmux configuration

## Setup
Install tmux (probably just by apt, or whatever your package manager is -- we aren't power users here, so the vanilla install is fine).

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
