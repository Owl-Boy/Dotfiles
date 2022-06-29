#
# ███████╗██╗███████╗██╗  ██╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗ 
# ██╔════╝██║██╔════╝██║  ██║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝ 
# █████╗  ██║███████╗███████║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
# ██╔══╝  ██║╚════██║██╔══██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
# ██║     ██║███████║██║  ██║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝ 
#                                                                              
# My Fish Config =)


### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
set TERM "xterm-256color"                         # Sets the terminal type
set EDITOR "neovide"                                 # $EDITOR use Emacs in terminal
set VISUAL "neovide"                                 # $VISUAL use Emacs in GUI mode

### SET MAN PAGER ###

# "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# # "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

### SET VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### PISCES ###
set -U pisces_pairs $pisces_pairs '<,>' '`,`' '«,»'
set -U pisces_only_insert_at_eol 1


### ALIASES ###

# Changing "ls" to "exa"
alias ls='exa -l --color=always --group-directories-first --icons'  # my preferred listing
alias ln='exa --color=always --group-directories-first --icons'
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -al --color=always --group-directories-first --icons' # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.='exa -a --color=always | egrep "^\."'              # dotfiles listing
alias ld='exa -lD --color=always --icons' # tree listing

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# \x1b[2J   <- clears tty
# \x1b[1;1H <- goes to (1, 1) (start)
# alias clear='echo -en "\x1b[2J\x1b[1;1H" ; echo; echo; seq 1 (tput cols) | sort -R | spark | lolcat; echo; echo'

# nvim
alias vi='nvim'
function vide # setting vi as an alias for neovide
  neovide $argv ; exit
end

# pacman and yay
alias pacsyu='sudo pacman -Syyu'                 # update only standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'  # remove orphaned packa

# Colorize grep output (good for log files)
alias grep='grep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# git
alias addup='git add -u'
alias addall='git add -A'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'
alias addremote='git remote add origin'

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# termbin
alias tb="nc termbin.com 9999"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# configs
alias fishcfg="vide ~/.config/fish/config.fish"
alias xmonadcfg="vide ~/.xmonad/xmonad.hs"
alias zshcfg="code ~/.zshrc"
alias bashcfg="vide ~/.bashrc"
alias nvimcfg="vide ~/.config/nvim/init.lua"
alias kittycfg="vide ~/.config/kitty/kitty.conf"

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"
alias mirrorr="sudo reflector --latest 50 --number 20 --sort rate --save /etc/pacman.d/mirrorlist"

# adding colors
alias tree="tree -C"

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# htop alternatives
# alias htop="btop --utf-force"
# alias htop = btm

# git bare repository
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# reprinting colorscript on clear
alias clr='clear; colorscript -r'

# fast sourcing
alias sfsh='source ~/.config/fish/config.fish'

# running minecraft with nvidia graphics
alias minecraft-launcher='prime-run minecraft-launcher'

#pipes
alias pipes='colorscript -e pipes2'
alias pipesd='colorscript -e pipes1'
alias pipess='colorscript -e pipes2-slim'
### END OF ALIASES ###


### SCRIPTS

colorscript -r # Cool Scripts to print stuff when terminal opens
