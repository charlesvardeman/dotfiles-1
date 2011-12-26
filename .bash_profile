pathdirs=( /usr/bin /bin /usr/sbin /sbin
           /usr/bin/*_perl /usr/bin/perlbin/vendor
           /usr/lib/perl5/*_perl/bin /usr/share/perl5/*_perl
           /home/c00kiemon5ter/.bin /usr/local/bin )
IFS=:; export PATH="${pathdirs[*]}" && unset pathdirs

export LC_COLLATE="C"
export LC_CTYPE="el_GR.UTF-8"
export LC_MONETARY="el_GR.UTF-8"

export HISTCONTROL=erasedups:ignorespace
export HISTIGNORE="&:pwd:cd:~:[bf]g:history *:l:l[wsla]:lla:exit:\:q"

export BROWSER="chromium"
export EDITOR="vim"
export PAGER="less"

export MOST_SWITCHES="-s"
export MOST_EDITOR="$EDITOR"
export SLANG_EDITOR="$EDITOR"

export GREP_OPTIONS='--color=auto -I'

export LESS="-FXRS"
export LESSHISTFILE="/tmp/.lesshst"
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;46;37m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

source "$HOME/.bashrc"

pkill -u "$USER" lsyncd
lsyncd --logfile "$HOME/.lsyncd/music.sync.log" -rsync "$HOME/music/" "$HOME/data/music/syncd_music/"
lsyncd --logfile "$HOME/.lsyncd/projects.sync.log" -rsync "$HOME/projects/" "$HOME/data/projects/syncd_projects/"
lsyncd --logfile "$HOME/.lsyncd/scripts.sync.log" -rsync "$HOME/.bin/" "$HOME/data/projects/syncd_scripts/"

if [[ -z "$DISPLAY" ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
    startx
    logout
fi

