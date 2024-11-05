export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git
zsh-syntax-highlighting
zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root)

DIR=~/.config/zshrc

source "$DIR/chmod.zsh"
source "$DIR/chromium.zsh"
source "$DIR/derictory.zsh"
source "$DIR/dns.zsh"
source "$DIR/docker.zsh"
source "$DIR/find.zsh"
source "$DIR/firefox.zsh"
source "$DIR/git.zsh"
source "$DIR/kill.zsh"
source "$DIR/nvim.zsh"
source "$DIR/ping.zsh"
source "$DIR/poetry.zsh"
source "$DIR/python.zsh"
source "$DIR/ssh.zsh"
source "$DIR/tmux.zsh"
source "$DIR/user_script.zsh"
source "$DIR/vpn.zsh"
source "$DIR/waybar.zsh"
source "$DIR/wifi.zsh"
source "$DIR/yay.zsh"
source "$DIR/zoxide.zsh"
source "$DIR/zsh.zsh"
