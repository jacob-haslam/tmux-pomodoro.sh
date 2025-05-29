# tmux-pomodoro.sh
Bash script that makes a pomodoro timer intended for tmux but could be used in other applications.


Example usage in ~/.config/tmux/tmux.conf:

set -g status-interval 1

set -g status-right '#(cat /tmp/tmux-pomodoro-status 2>/dev/null || echo "")'

bind-key p run-shell "tmux run-shell '~/.config/tmux/tmux-pomodoro.sh break 5'"

bind-key P run-shell "tmux run-shell '~/.config/tmux/tmux-pomodoro.sh work 25'"
