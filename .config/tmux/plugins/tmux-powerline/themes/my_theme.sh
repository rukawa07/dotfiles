# shellcheck shell=bash disable=SC2034
# My Theme

# Colors 
nord0="#2e3440"
nord1="#3b4252"
nord2="#434c5e"
nord3="#4c566a"
nord4="#d8dee9"
nord5="#e5e9f0"
nord6="#eceff4"
nord7="#8fbcbb"
nord8="#88c0d0"
nord9="#81a1c1"
nord10="#5e81ac"
nord11="#bf616a"
nord12="#d08770"
nord13="#ebcb8b"
nord14="#a3be8c"
nord15="#b48ead"

if patched_font_in_use; then
	TMUX_POWERLINE_SEPARATOR_LEFT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD=""
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN=""
else TMUX_POWERLINE_SEPARATOR_LEFT_BOLD="◀"
	TMUX_POWERLINE_SEPARATOR_LEFT_THIN="❮"
	TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD="▶"
	TMUX_POWERLINE_SEPARATOR_RIGHT_THIN="❯"
fi

TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_BACKGROUND_COLOR:-$nord1}
TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR=${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR:-$nord6}

TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_RIGHT_BOLD}
TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR=${TMUX_POWERLINE_DEFAULT_RIGHTSIDE_SEPARATOR:-$TMUX_POWERLINE_SEPARATOR_LEFT_BOLD}

# See man tmux.conf for additional formatting options for the status line.
# The `format regular` and `format inverse` functions are provided as conveinences

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_CURRENT ]; then
	TMUX_POWERLINE_WINDOW_STATUS_CURRENT=(
		"#[$(format inverse)]" \
      "#[bg=blue]$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR" \
		" #[bold, bg=blue]#I " \
		"#[bg=blue]$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN" \
		" #[bold, bg=blue]#W " \
		"#[$(format regular)]" \
		"#[fg=blue]$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
	)
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_STYLE ]; then
	TMUX_POWERLINE_WINDOW_STATUS_STYLE=(
		"$(format regular)"
	)
fi

if [ -z $TMUX_POWERLINE_WINDOW_STATUS_FORMAT ]; then
	TMUX_POWERLINE_WINDOW_STATUS_FORMAT=(
		"#[$(format inverse)]" \
    "#[bg=brightblack]$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR" \
		" #[bg=brightblack, fg=white]#I " \
    "#[bg=brightblack, fg=white]$TMUX_POWERLINE_SEPARATOR_RIGHT_THIN" \
		" #[bg=brightblack, fg=white]#W "
		"#[$(format regular)]" \
		"#[fg=brightblack]$TMUX_POWERLINE_DEFAULT_LEFTSIDE_SEPARATOR"
	)
fi

# Format: segment_name background_color foreground_color [non_default_separator]

if [ -z $TMUX_POWERLINE_LEFT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_LEFT_STATUS_SEGMENTS=(
		"tmux_icon $nord8 $nord1" \
		# "my_tmux_session_info 4 235" \
		# "hostname 33 0" \
		# "ifstat 30 255" \
		# "ifstat_sys 30 255" \
		# "lan_ip 24 255 ${TMUX_POWERLINE_SEPARATOR_RIGHT_THIN}" \
		# "wan_ip 24 255" \ "vcs_branch 29 88" \
		# "vcs_compare 60 255" \
		# "vcs_staged 64 255" \
		# "vcs_modified 9 255" \
		# "vcs_others 245 0" \
	)
fi

if [ -z $TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS ]; then
	TMUX_POWERLINE_RIGHT_STATUS_SEGMENTS=(
		#"earthquake 3 0" \
		# "pwd 89 211" \
		#"macos_notification_count 29 255" \
		#"mailcount 9 255" \
		# "now_playing 234 37" \
		# "cpu 240 136" \
		# "load 237 167" \
		# "tmux_mem_cpu_load 234 136" \
		# "weather 37 255" \
		#"rainbarf 0 ${TMUX_POWERLINE_DEFAULT_FOREGROUND_COLOR}" \
		#"xkb_layout 125 117" \
		"date_day $nord3 $nord6" \
		"date $nord3 $nord6 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
		"time $nord3 $nord6 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
		"my_battery $nord13 $nord3" \
		#"utc_time 235 136 ${TMUX_POWERLINE_SEPARATOR_LEFT_THIN}" \
	)
fi
