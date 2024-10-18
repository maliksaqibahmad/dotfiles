# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set the Zsh theme to Robby Russell
 ZSH_THEME="robbyrussell"

# Load Powerlevel10k
# source ~/powerlevel10k/powerlevel10k.zsh-theme

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
 DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup

plugins=(
  git               # Git plugin
  zsh-syntax-highlighting # Syntax highlighting for zsh
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
#Aliases
# System updates and cleanup
alias update='sudo pacman -Syu && yay -Yc'   # Full system update with cleaning

# Pacman shortcuts
alias pacup='sudo pacman -Syu'               # System update
alias pacs='pacman -Ss'                      # Search for packages
alias paci='sudo pacman -S'                  # Install a package
alias pacr='sudo pacman -R'                  # Remove a package
alias pacinfo='pacman -Qi'                   # Show package info
alias paclog='cat /var/log/pacman.log'       # View Pacman logs

# Yay shortcuts (for AUR)
alias yays='yay -Ss'                         # Search AUR packages
alias yayi='yay -S'                          # Install AUR packages
alias yayr='yay -R'                          # Remove AUR packages
alias yayc='yay -Sc'                         # Clean up unneeded AUR files

# File and directory navigation
alias ..='cd ..'                             # Move up one directory
alias ...='cd ../..'                         # Move up two directories
alias ....='cd ../../..'                     # Move up three directories
alias docs='cd ~/Documents'                  # Quickly navigate to Documents folder
alias downloads='cd ~/Downloads'                    # Quickly navigate to Downloads folder

# Common commands
alias cls='clear'                            # Clear terminal screen
alias dfh='df -h'                            # Disk usage with human-readable sizes
alias duh='du -sh'                           # Folder size with human-readable output
alias cpv='rsync -ah --info=progress2'       # Copy files with progress bar

# Networking
alias pingg='ping google.com'                # Quick ping to Google DNS
alias netstat='ss -tuln'                     # View listening ports and services

# Git shortcuts
alias gs='git status'                        # Check Git status
alias ga='git add .'                         # Stage all changes
alias gc='git commit -m'                     # Commit with a message
alias gpush='git push origin $(git rev-parse --abbrev-ref HEAD)' # Push current branch
alias gpull='git pull origin $(git rev-parse --abbrev-ref HEAD)' # Pull current branch
alias gco='git checkout'                     # Switch Git branches

# Arch Linux-specific shortcuts
alias mirrors='sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist' # Refresh mirrorlist
alias dmesgless='dmesg | less'               # View kernel messages in less
alias paclean='sudo pacman -Sc'              # Clean up cache for installed packages

# Power management
alias reboot='sudo systemctl reboot'         # Reboot system
alias shutdown='sudo systemctl poweroff'     # Shutdown system

# Vim
alias v='nvim'                             # Open Neovim instead of Vim

# IP addresses
alias ipv4="ip addr show | grep 'inet ' | grep -v '127.0.0.1' | cut -d' ' -f6 | cut -d/ -f1"

# IP addresses
alias ipv6="ip addr show | grep 'inet6 ' | cut -d ' ' -f6 | sed -n '2p'"

# Orphaned packages
alias autorem='orphans=$(pacman -Qdtq); [ -z "$orphans" ] && echo "There are no orphaned packages" || sudo pacman -Rsc $orphans'

# Check for updates
alias hmmm='yay -Sy &> /dev/null && yay -Qu'

# Reload .zshrc
alias yesss='source ~/.zshrc && echo ".zshrc sourced!"'

# Weather
alias weather='curl wttr.in/Gujrat | head -n -1'

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# bun completions
[ -s "/home/maliksaqibahmad/.bun/_bun" ] && source "/home/maliksaqibahmad/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export EDITOR="nvim"
export VISUAL="nvim"

# Automatically start tmux if not already inside tmux
#if [[ -z "$TMUX" ]] && [ -n "$PS1" ]; then
#    tmux
#    exit  # Exit the terminal after tmux exits
#fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
# ~/.zshrc

# eval "$(starship init zsh)"
