# Add binaries into the path
# PATH=~/.dotfiles/bin:$PATH
# export PATH

# Source all files in ~/.dotfiles/bash/
function src() {
  local file
  if [[ "$1" ]]; then
    source "$HOME/{{ destination }}/bash/$1.sh"
  else
    for file in ~/{{ destination }}/bash/*; do
      source "$file"
    done
  fi
}

src
