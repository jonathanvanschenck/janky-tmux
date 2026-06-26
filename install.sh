#!/usr/bin/env bash
set -e

INSTALL_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "janky-tmux: installing from $INSTALL_DIR"

LOCAL_CONF="$INSTALL_DIR/local.conf"

if [ -f "$LOCAL_CONF" ]; then
    echo "local.conf already exists — skipping (edit it directly to customize)"
else
    cat > "$LOCAL_CONF" << 'EOF'
# local.conf — machine-specific overrides (gitignored)
# Sourced at the end of tmux.conf. Use for local tweaks, e.g.:
#
#   # macOS clipboard (replace xclip with pbcopy)
#   bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "pbcopy"
EOF
    echo "Created $LOCAL_CONF"
fi

echo "Done. Start a new session with: tmux -f $INSTALL_DIR/tmux.conf"
