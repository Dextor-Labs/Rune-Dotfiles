# path
# Doom Emacs
#export PATH="$HOME/.config/emacs/bin:$PATH"
# go
#export PATH="$HOME/go/bin:$PATH"

# Keep PATH entries unique
typeset -U path PATH

# Add my custom paths
path=(
  "$HOME/go/bin"
  "$HOME/.config/emacs/bin"
  "$HOME/Developer/scripts"
  "$HOME/.local/bin"
  $path
)

