#functions
#
#
#
#mkcd() {
 # mkdir -p "$1" && cd "$1"
#}
mkcd() {
  if [[ -z "$1" ]]; then
    echo "Usage: mkcd <folder>"
    return 1
  fi
  mkdir -p "$1" && cd "$1" || return 1
}

#cproj() {
 # cd ~/Developer/"$1"
#}
cproj() {
  if [[ -z "$1" ]]; then
    echo "Usage: cproj <folder>"
    return 1
  fi
  cd "$HOME/Developer/$1" || return 1
}

#gitnew() {
 # mkdir -p "$1" && cd "$1" && git init
#}
gitnew() {
  if [[ -z "$1" ]]; then
    echo "Usage: gitnew <project-name>"
    return 1
  fi
  mkdir -p "$1" && cd "$1" && git init || return 1
}


# 1. Quick version (fast + simple)
extract() {
  if [[ -z "$1" ]]; then
    echo "Usage: extract <archive-file>"
    return 1
  fi

  if [[ ! -f "$1" ]]; then
    echo "File not found: $1"
    return 1
  fi

  case "$1" in
    *.tar.bz2|*.tbz2) tar xjf "$1" ;;
    *.tar.gz|*.tgz)   tar xzf "$1" ;;
    *.tar.xz)         tar xJf "$1" ;;
    *.bz2)            bunzip2 "$1" ;;
    *.rar)            unrar x "$1" ;;
    *.gz)             gunzip "$1" ;;
    *.tar)            tar xf "$1" ;;
    *.zip)            unzip "$1" ;;
    *.Z)              uncompress "$1" ;;
    *.7z)             7z x "$1" ;;
    *)
      echo "Cannot extract: $1"
      return 1
      ;;
  esac
}

# 2. Clean version (best practice)
extract_clean() {
  local archive target base

  if [[ -z "$1" ]]; then
    echo "Usage: extract_clean <archive-file>"
    return 1
  fi

  archive="$1"

  if [[ ! -f "$archive" ]]; then
    echo "File not found: $archive"
    return 1
  fi

  # Get filename without path + extensions
  base="${archive:t}"
  base="${base%.tar.bz2}"
  base="${base%.tbz2}"
  base="${base%.tar.gz}"
  base="${base%.tgz}"
  base="${base%.tar.xz}"
  base="${base%.tar}"
  base="${base%.zip}"
  base="${base%.7z}"
  base="${base%.rar}"
  base="${base%.gz}"
  base="${base%.bz2}"
  base="${base%.Z}"

  target="./$base"

  mkdir -p "$target" || return 1

  case "$archive" in
    *.tar.bz2|*.tbz2) tar xjf "$archive" -C "$target" ;;
    *.tar.gz|*.tgz)   tar xzf "$archive" -C "$target" ;;
    *.tar.xz)         tar xJf "$archive" -C "$target" ;;
    *.tar)            tar xf "$archive" -C "$target" ;;
    *.zip)            unzip "$archive" -d "$target" ;;
    *.7z)             7z x "$archive" "-o$target" ;;
    *.rar)            unrar x "$archive" "$target/" ;;
    *.gz)             gunzip "$archive" ;;
    *.bz2)            bunzip2 "$archive" ;;
    *.Z)              uncompress "$archive" ;;
    *)
      echo "Cannot extract: $archive"
      return 1
      ;;
  esac
}



# yazi
function yy() {
  tmp="$(mktemp -t yazi-cwd.XXXXXX)" || return 1
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ]; then
    cd "$cwd" || return 1
  fi
  rm -f -- "$tmp"
}

# # Python
# mkpy() {
#   if [[ -z "$1" ]]; then
#     echo "Usage: mkpy <project-name>"
#     return 1
#   fi

#   local base="$HOME/Developer/Python-Dev"
#   local project="$base/$1"

#   if [[ -e "$project" ]]; then
#     echo "Project already exists: $project"
#     return 1
#   fi 


# # Python envment pip 
#   mkdir -p "$project"/{src,tests} || return 1
#   cd "$project" || return 1

#   python3 -m venv .venv || return 1
#   source .venv/bin/activate || return 1
#   python -m pip install pytest black isort || return 1

#   touch README.md src/main.py tests/test_main.py

#   cat > src/main.py <<'EOF'
# def main():
#     print("Hello, world!")


# if __name__ == "__main__":
#     main()
# EOF

#   cat > tests/test_main.py <<'EOF'
# def test_placeholder():
#     assert True
# EOF

#   echo "# $1" > README.md

#   echo "Created Python project at: $project"
#   echo "Virtual environment activated."
# }

#Pythone3 and pip setup - env 
mkpy() {
  if [[ -z "$1" ]]; then
    echo "Usage: mkpy <project-name>"
    return 1
  fi

  local base="$HOME/Developer/Python-Dev"
  local name="$1"
  local project="$base/$name"

  if [[ -e "$project" ]]; then
    echo "Project already exists: $project"
    return 1
  fi

  mkdir -p "$project"/{src,tests} || return 1
  cd "$project" || return 1

  python3 -m venv .venv || return 1
  .venv/bin/python -m pip install --upgrade pip || return 1
  .venv/bin/python -m pip install pytest black isort || return 1

  cat > README.md <<EOF
# $name
EOF

  cat > .gitignore <<'EOF'
.venv/
__pycache__/
.pytest_cache/
*.pyc
EOF

  cat > requirements-dev.txt <<'EOF'
pytest
black
isort
EOF

  cat > src/main.py <<'EOF'
def main():
    print("Hello, world!")


if __name__ == "__main__":
    main()
EOF

  cat > tests/test_main.py <<'EOF'
def test_placeholder():
    assert True
EOF

  #git init >/dev/null 2>&1

  echo "Created Python project at: $project"
  echo "Virtual environment created, but not activated."
  echo "To activate it:"
  echo "  cd $project && source .venv/bin/activate"
}


#py test 
# mkpy() {
#   local base="$HOME/Developer/Python-Dev"
#   local name project kind

#   if [[ $# -ne 1 ]]; then
#     echo "Usage: mkpy <project-name>"
#     return 1
#   fi

#   name="$1"
#   project="$base/$name"

#   if [[ ! "$name" =~ ^[A-Za-z0-9._-]+$ ]]; then
#     echo "Error: project name can only use letters, numbers, dot, underscore, and dash."
#     return 1
#   fi

#   if ! command -v python3 >/dev/null 2>&1; then
#     echo "Error: python3 is not installed or not in PATH."
#     return 1
#   fi

#   mkdir -p "$base" || {
#     echo "Error: could not create base directory: $base"
#     return 1
#   }

#   if [[ -e "$project" ]]; then
#     echo "Error: project already exists: $project"
#     return 1
#   fi

#   echo "Choose project type:"
#   echo "  1) plain"
#   echo "  2) gui"
#   echo "  3) terminal"
#   read -r "?Enter choice [1-3]: " kind

#   case "$kind" in
#     1) kind="plain" ;;
#     2) kind="gui" ;;
#     3) kind="terminal" ;;
#     *)
#       echo "Error: invalid choice."
#       return 1
#       ;;
#   esac

#   case "$kind" in
#     gui)
#       mkdir -p "$project"/{src,tests,data,covers,assets} || {
#         echo "Error: could not create project folders."
#         return 1
#       }
#       ;;
#     plain|terminal)
#       mkdir -p "$project"/{src,tests,data,assets} || {
#         echo "Error: could not create project folders."
#         return 1
#       }
#       ;;
#   esac

#   cd "$project" || {
#     echo "Error: could not enter project directory."
#     return 1
#   }

#   python3 -m venv .venv || {
#     echo "Error: failed to create virtual environment."
#     return 1
#   }

#   .venv/bin/python -m pip install --upgrade pip || {
#     echo "Error: failed to upgrade pip."
#     return 1
#   }

#   .venv/bin/python -m pip install pytest black isort || {
#     echo "Error: failed to install development tools."
#     return 1
#   }

#   cat > README.md <<EOF
# # $name
# EOF

#   cat > .gitignore <<'EOF'
# .venv/
# __pycache__/
# .pytest_cache/
# *.pyc
# *.pyo
# *.pyd
# .DS_Store
# EOF

#   cat > requirements-dev.txt <<'EOF'
# pytest
# black
# isort
# EOF

#   cat > pyproject.toml <<'EOF'
# [tool.black]
# line-length = 88

# [tool.isort]
# profile = "black"
# line_length = 88

# [tool.pytest.ini_options]
# testpaths = ["tests"]
# pythonpath = ["src"]
# EOF

#   case "$kind" in
#     gui)
#       cat > requirements.txt <<'EOF'
# customtkinter
# pillow
# EOF

#       cat > src/main.py <<'EOF'
# def main():
#     print("Hello from your GUI app project!")


# if __name__ == "__main__":
#     main()
# EOF
#       ;;
#     terminal)
#       cat > requirements.txt <<'EOF'
# EOF

#       cat > src/main.py <<'EOF'
# def main():
#     print("Hello from your terminal app project!")


# if __name__ == "__main__":
#     main()
# EOF
#       ;;
#     plain)
#       cat > requirements.txt <<'EOF'
# EOF

#       cat > src/main.py <<'EOF'
# def main():
#     print("Hello from your Python project!")


# if __name__ == "__main__":
#     main()
# EOF
#       ;;
#   esac

#   cat > tests/test_main.py <<'EOF'
# def test_placeholder():
#     assert True
# EOF

#   echo
#   echo "Created $kind Python project at:"
#   echo "  $project"
#   echo
#   echo "Next steps:"
#   echo "  cd \"$project\""
#   echo "  source .venv/bin/activate"
#   if [[ "$kind" == "gui" ]]; then
#     echo "  pip install -r requirements.txt"
#   fi
#   echo "  python src/main.py"
# }


#py Gui Termail Plain & mkpygtp = make Python GUI / Plain / Terminal project
mkpyptg() {
  local base="$HOME/Developer/Python-Dev"
  local name project choice kind git_choice gui_pkg_choice

  # Colors
  local RED GREEN YELLOW BLUE RESET
  RED='\033[0;31m'
  GREEN='\033[0;32m'
  YELLOW='\033[1;33m'
  BLUE='\033[0;34m'
  RESET='\033[0m'

  if [[ $# -ne 1 ]]; then
    printf "${RED}Usage:${RESET} mkpyptg <project-name>\n"
    return 1
  fi

  name="$1"
  project="$base/$name"

  if [[ ! "$name" =~ ^[A-Za-z0-9._-]+$ ]]; then
    printf "${RED}Error:${RESET} project name can only use letters, numbers, dot, underscore, and dash.\n"
    return 1
  fi

  if ! command -v python3 >/dev/null 2>&1; then
    printf "${RED}Error:${RESET} python3 is not installed or not in PATH.\n"
    return 1
  fi

  mkdir -p "$base" || {
    printf "${RED}Error:${RESET} could not create base directory: %s\n" "$base"
    return 1
  }

  if [[ -e "$project" ]]; then
    printf "${RED}Error:${RESET} project already exists: %s\n" "$project"
    return 1
  fi

  printf "${BLUE}Choose project type:${RESET}\n"
  printf "  1) plain\n"
  printf "  2) gui\n"
  printf "  3) terminal\n"
  read -r "?Enter choice [1-3]: " choice

  case "$choice" in
    1) kind="plain" ;;
    2) kind="gui" ;;
    3) kind="terminal" ;;
    *)
      printf "${RED}Error:${RESET} invalid choice.\n"
      return 1
      ;;
  esac

  printf "${BLUE}Initialize git repository?${RESET}\n"
  read -r "?Enter [y/N]: " git_choice

  gui_pkg_choice="n"
  if [[ "$kind" == "gui" ]]; then
    printf "${BLUE}Install GUI app packages in requirements.txt?${RESET}\n"
    printf "  This adds: customtkinter, pillow\n"
    read -r "?Enter [Y/n]: " gui_pkg_choice
    gui_pkg_choice="${gui_pkg_choice:-y}"
  fi

  case "$kind" in
    gui)
      mkdir -p "$project"/{src,tests,data,covers,assets} || {
        printf "${RED}Error:${RESET} could not create project folders.\n"
        return 1
      }
      ;;
    plain|terminal)
      mkdir -p "$project"/{src,tests,data,assets} || {
        printf "${RED}Error:${RESET} could not create project folders.\n"
        return 1
      }
      ;;
  esac

  cd "$project" || {
    printf "${RED}Error:${RESET} could not enter project directory.\n"
    return 1
  }

  python3 -m venv .venv || {
    printf "${RED}Error:${RESET} failed to create virtual environment.\n"
    return 1
  }

  .venv/bin/python -m pip install --upgrade pip || {
    printf "${RED}Error:${RESET} failed to upgrade pip.\n"
    return 1
  }

  .venv/bin/python -m pip install pytest black isort || {
    printf "${RED}Error:${RESET} failed to install development tools.\n"
    return 1
  }

  cat > README.md <<EOF
# $name
EOF

  cat > .gitignore <<'EOF'
.venv/
__pycache__/
.pytest_cache/
*.pyc
*.pyo
*.pyd
.DS_Store
EOF

  cat > requirements-dev.txt <<'EOF'
pytest
black
isort
EOF

  cat > pyproject.toml <<'EOF'
[tool.black]
line-length = 88

[tool.isort]
profile = "black"
line_length = 88

[tool.pytest.ini_options]
testpaths = ["tests"]
pythonpath = ["src"]
EOF

  case "$kind" in
    gui)
      if [[ "$gui_pkg_choice" =~ ^[Nn]$ ]]; then
        : > requirements.txt
      else
        cat > requirements.txt <<'EOF'
customtkinter
pillow
EOF
      fi

      cat > src/main.py <<'EOF'
def main():
    print("Hello from your GUI app project!")


if __name__ == "__main__":
    main()
EOF
      ;;
    terminal)
      : > requirements.txt

      cat > src/main.py <<'EOF'
def main():
    print("Hello from your terminal app project!")


if __name__ == "__main__":
    main()
EOF
      ;;
    plain)
      : > requirements.txt

      cat > src/main.py <<'EOF'
def main():
    print("Hello from your Python project!")


if __name__ == "__main__":
    main()
EOF
      ;;
  esac

  cat > tests/test_main.py <<'EOF'
def test_placeholder():
    assert True
EOF

  if [[ "$git_choice" =~ ^[Yy]$ ]]; then
    if command -v git >/dev/null 2>&1; then
      git init >/dev/null 2>&1 && printf "${GREEN}Git repository initialized.${RESET}\n"
    else
      printf "${YELLOW}Warning:${RESET} git is not installed, so git init was skipped.\n"
    fi
  fi

  printf "\n${GREEN}Created %s Python project at:${RESET}\n" "$kind"
  printf "  %s\n\n" "$project"
  printf "${BLUE}Next steps:${RESET}\n"
  printf "  cd \"%s\"\n" "$project"
  printf "  source .venv/bin/activate\n"
  if [[ -s requirements.txt ]]; then
    printf "  pip install -r requirements.txt\n"
  fi
  printf "  python src/main.py\n"
}