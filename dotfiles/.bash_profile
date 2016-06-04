if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/bin:$PATH"
PATH="${HOME}/homebrew/bin:$PATH"
PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
PATH="$(brew --prefix php56)/bin:$PATH"
export PATH
export HOMEBREW_GITHUB_API_TOKEN=your_github_api_token_here
export CLICOLOR=1
export LESS="-FRX"
export EDITOR=vim
export VISUAL=vim
#export PHP_INI_SCAN_DIR=~/homebrew/etc/php/5.6/conf.d
#export LESS="-FRSX" # git behavior

for file in /Users/xf0x/homebrew/etc/bash_completion.d/*; do
	source $file
done
source /Users/xf0x/.git-completion.bash

##########
# COLORS #
##########
BLACK='\e[0;30m' 	# Black - Regular
RED='\e[0;31m' 		# Red
GREEN='\e[0;32m' 	# Green
YELLOW='\e[0;33m' 	# Yellow
BLUE='\e[0;34m' 	# Blue
PURPLE='\e[0;35m' 	# Purple
CYAN='\e[0;36m' 	# Cyan
WHITE='\e[0;37m' 	# White
BLACK_BOLD='\e[1;30m' 	# Black - Bold
RED_BOLD='\e[1;31m' 	# Red
GREEN_BOLD='\e[1;32m' 	# Green
YELLOW_BOLD='\e[1;33m' 	# Yellow
BLUE_BOLD='\e[1;34m' 	# Blue
PURPLE_BOLD='\e[1;35m' 	# Purple
CYAN_BOLD='\e[1;36m' 	# Cyan
WHITE_BOLD='\e[1;37m' 	# White
BLACK_ULINE='\e[4;30m' 	# Black - Underline
RED_ULINE='\e[4;31m' 	# Red
GREEN_ULINE='\e[4;32m' 	# Green
YELLOW_ULINE='\e[4;33m' # Yellow
BLUE_ULINE='\e[4;34m' 	# Blue
PURPLE_ULINE='\e[4;35m' # Purple
CYAN_ULINE='\e[4;36m' 	# Cyan
WHITE_ULINE='\e[4;37m' 	# White
BLACK_BG='\e[40m'   	# Black - Background
RED_BG='\e[41m'   	# Red
GREEN_BG='\e[42m'   	# Green
YELLOW_BG='\e[43m'   	# Yellow
BLUE_BG='\e[44m'   	# Blue
PURPLE_BG='\e[45m'   	# Purple
CYAN_BG='\e[46m'   	# Cyan
WHITE_BG='\e[47m'   	# White
COLOR_RESET='\e[0m'    	# Text Reset
###########
# /COLORS #
###########

source ~/.git-prompt.sh
PS1="\h:\W \u\[$CYAN\]\$(__git_ps1)\[$COLOR_RESET\]\$ "
