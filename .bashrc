
# Source global definitions
if [ -f /etc/bashrc ]; then :; source /etc/bashrc; fi

source ~/.bashrc_default
source ~/.bashrc_alias

export GEM_HOME="${HOME}/gems"
export PATH="${HOME}/gems/bin:${PATH}"

# export ACKRC=".ackrc"

# Colors in the <d>;40-44 range are awful with the highlight
# $dircolors shows the original?
export LS_COLORS=$(echo "${LS_COLORS}" | sed 's/;4/;3/g')

