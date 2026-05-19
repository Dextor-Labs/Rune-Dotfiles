


#----------------------------------
# General
# ---------------------------------
#alias reload="source ~/.zshrc"
#alias la="ls -la"
#alias ll="ls -lh"
alias cls="clear"

# eza 
alias ls="eza --icons --group-directories-first --no-quotes"
alias la="eza -lha --icons --git --group-directories-first"
alias lla="eza -a --oneline --icons --git --group-directories-first --no-quotes"
alias ll="eza -l --icons --git --group-directories-first"
alias lt="eza --tree --level=2 --icons"
alias l="eza -l --icons --git --group-directories-first --header"

#----------------------------------
# Navigation
# ---------------------------------
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

#----------------------------------
# Navigation Folders
#----------------------------------
alias ~="cd ~"
alias desk="cd ~/Desktop"
alias docs="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dev="cd ~/Developer"
alias cf="cd ~/.config"

#----------------------------------
# Navgation Costom Folders
#----------------------------------
#alias gdev="cd ~/Developer/GitDev"
alias rune="cd ~/Developer/Rune-Dotfiles"
alias pydev="cd ~/Developer/Python-Dev"
#alias godev="cd ~/Developer/"
#alias rusdev="cd ~/Developer"
alias scrdev="cd ~/Developer/scripts"

#----------------------------------
# Safer file operations 
#-----------------------------------
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

#-----------------------------------
# Editors
#-----------------------------------
#alias nv="nvim"
#alias vi="nvim"
#alias vim="nvim"

alias zshconfig="nvim ~/.zshrc"
alias zaliases="nvim ~/.config/zsh/aliases.zsh"
alias tmuxconf="nvim ~/.config/tmux/tmux.conf"
alias ghosttyconf="nvim ~/.config/ghostty/config"
alias nvimconf="cd ~/.config/nvim && nvim ."

#-----------------------------------
# Git
#-----------------------------------
alias g="git"

# status / add / commit
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"

# branch / checkout / switch
alias gb="git branch"
alias gba="git branch -a"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gsw="git switch"
alias gswc="git switch -c"

# diff / log
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log --oneline --graph --decorate --all"
alias glast="git log -1 HEAD --stat"

# pull / push / fetch
alias gp="git push"
alias gpl="git pull"
alias gf="git fetch"
alias gplr="git pull --rebase"

# restore / reset / stash
alias grs="git restore"
alias grst="git restore --staged"
alias gstash="git stash"
alias gstashp="git stash pop"

# common shortcuts
alias gcl="git clone"

#----------------------------------------------
# Dangerous Git commands — think before using
#careful commit/history actions
alias gcamend="git commit --amend"
alias gsoftundo="git reset --soft HEAD~1"
alias grcontinue="git rebase --continue"

# dangerous cleanup
alias gcleanfd="git clean -fd"
alias gpfwl="git push --force-with-lease"
#----------------------------------------------

#-------------------------------------------
# Homebrew
# ------------------------------------------
alias brewup="brew update && brew upgrade && brew cleanup"
alias brews="brew search"
alias brewi="brew install"
alias brewc="brew install --cask"
alias brewui="brew uninstall"
alias brewrmc="brew uninstall --cask"
alias brewls="brew list"
alias brewinfo="brew info"
alias brewdoctor="brew doctor"


#----------------------------------------------------------
# Tmux
#----------------------------------------------------------
alias tmux="tmux -f ~/.config/tmux/tmux.conf"


#----------------------------------------------------------
# Doom Emacs
#----------------------------------------------------------
#alias e="emacs -nw"
#alias doom="doom emacs -nw"





# ---------------------------------------------------------
# Functions
# Better than aliases when arguments are needed
# ---------------------------------------------------------

#functions 2 extract
alias xc='extract_clean'








