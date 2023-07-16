#!/bin/bash

# Colors
RESET="\033[0;33m"
RED="\033[38;2;210;15;57m"
CYAN="\033[38;2;4;165;229m"
GREEN="\033[38;2;64;160;43m"

banner(){
    echo -e "$CYAN
 ██████╗ ██╗  ██╗██╗  ██╗    ██████╗ ███████╗██████╗ ███████╗███████╗ ██████╗    ██╗
██╔═══██╗██║  ██║██║  ██║    ██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝██╔════╝    ██║
██║   ██║███████║███████║    ██║  ██║█████╗  ██║  ██║███████╗█████╗  ██║         ██║
██║   ██║██╔══██║██╔══██║    ██║  ██║██╔══╝  ██║  ██║╚════██║██╔══╝  ██║         ╚═╝
╚██████╔╝██║  ██║██║  ██║    ██████╔╝███████╗██████╔╝███████║███████╗╚██████╗    ██╗
 ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝    ╚═════╝ ╚══════╝╚═════╝ ╚══════╝╚══════╝ ╚═════╝    ╚═╝
███████╗███████╗████████╗    ███╗   ███╗██╗   ██╗    ██████╗  ██████╗               
██╔════╝██╔════╝╚══██╔══╝    ████╗ ████║╚██╗ ██╔╝    ██╔══██╗██╔════╝               
███████╗█████╗     ██║       ██╔████╔██║ ╚████╔╝     ██████╔╝██║                    
╚════██║██╔══╝     ██║       ██║╚██╔╝██║  ╚██╔╝      ██╔═══╝ ██║                    
███████║███████╗   ██║       ██║ ╚═╝ ██║   ██║       ██║     ╚██████╗               
╚══════╝╚══════╝   ╚═╝       ╚═╝     ╚═╝   ╚═╝       ╚═╝      ╚═════╝               
${RESET}"
}
banner

install_status(){
    echo -e "${CYAN}|-----------------------------------------------${RESET}" 
    echo -e "${GREEN}[+]${RESET} $1 "
    echo -e "${CYAN}|-----------------------------------------------${RESET}" 
}

if [[ $EUID != 0 ]]; then
    echo -e "${RED}[-]Please run this script as a root"
    exit 1
fi

# apt update && apt upgrade -y
app=(fish tmux rlwrap grc lsd python3 bypthon)
for apps in ${app[@]}; do 
    install_status "Installing $apps ..."
    # Edit below 
    echo apt install $apps
done

# Installing fisher
# curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
plugins=(jorgebucaran/fisher jorgebucaran/autopair.fish patrickf1/fzf.fish franciscolourenco/done jorgebucaran/replay.fish nickeb96/puffer-fish)
for plugin in ${plugins[@]}; do 
    # Edit below
    echo fisher install $plugin
done

# make one repo in there add all config
# make this script one liner to use it with curl command
