function GLOBAL {
  REPO=sashapop10/nixos

  NORMAL=$(tput sgr0)
  WHITE=$(tput setaf 7)
  BLACK=$(tput setaf 0)
  RED=$(tput setaf 1)
  GREEN=$(tput setaf 2)
  YELLOW=$(tput setaf 3)
  BLUE=$(tput setaf 4)
  MAGENTA=$(tput setaf 5)
  CYAN=$(tput setaf 6)
  BRIGHT=$(tput bold)
  UNDERLINE=$(tput smul)
}

about() {
    echo -E "$CYAN
       _   _ _       ___        ___           _        _ _
      | \ | (_)_  __/ _ \ ___  |_ _|_ __  ___| |_ __ _| | | ___ _ __
      |  \| | \ \/ / | | / __|  | || '_ \/ __| __/ _\` | | |/ _ \ '__|
      | |\  | |>  <| |_| \__ \  | || | | \__ \ || (_| | | |  __/ |
      |_|_\_|_/_/\_\\\\___/|___/ |___|_| |_|___/\__\__,_|_|_|\___|_|

       ____                        _                             _  ___
      | __ ) _   _   ___  __ _ ___| |__   __ _ _ __   ___  _ __ / |/ _ \\
      |  _ \| | | | / __|/ _\` / __| '_ \ / _\` | '_ \ / _ \| '_ \| | | | |
      | |_) | |_| | \__ \ (_| \__ \ | | | (_| | |_) | (_) | |_) | | |_| |
      |____/ \__, | |___/\__,_|___/_| |_|\__,_| .__/ \___/| .__/|_|\___/
             |___/                            |_|         |_|


               $BLUE$UNDERLINE https://github.com/sashapop10$NORMAL -> $GREEN'"./install.sh"'
          $RED  ! Make sure that your root partition mounted as $BLUE/mnt$RED !
     $NORMAL"
}

function log {
  echo -en $1
  echo -en "$NORMAL\n"
}

function prompt {
  echo -en $2
  read $1
  echo -en "$NORMAL"
}

function confirm {
  declare -n result=$1
  echo -en "$3[${GREEN}y${NORMAL}/${RED}n${NORMAL}]: "
  read -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    result=true
  elif [[ $REPLY =~ ^[Nn]$ ]]; then
    result=false
  else
    result=$2
  fi
}

function main {
  GLOBAL
  about

  log "Available hosts: $GREEN$(eza -D ./hosts)"
  prompt HOST "Choose$GREEN host$NORMAL: $YELLOW"
  FLAKE=$REPO#$HOST

  log "Using$GREEN github:$FLAKE"

  confirm ok true "Do you want to use$GREEN disko$NORMAL ? "
  if [[ $ok ]]; then
    log "Downloading$GREEN https://github.com/$REPO/$HOST/disko.nix"
    curl --progress-bar https://raw.githubusercontent.com/$REPO/main/hosts/$HOST/disko.nix > ./disko.nix
    echo -en "Edit$GREEN ./disko.nix$NORMAL before continuing"
    read -n 1 -r
    sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disko.nix
  fi

  git clone https://github.com/sashapop10/nixos ./flake
  if [[ !$ok ]]; then
    confirm ok true "Do you want to update $GREEN hardware$NORMAL configuration ? "
  fi
  if [[ $ok ]]; then
    sudo nixos-generate-config --dir ./tmp-config
    cp -f ./tmp-config/hardware-configuration.nix ./flake/hosts/$HOST
  fi

  echo -en "Edit$GREEN ./flake/environment.nix$NORMAL before continuing"
  read -n 1 -r
  sudo nixos-install --no-root-password --root /mnt --flake ./flake#$HOST
  log "Installation$GREEN successful"

  confirm ok false "Do you want to initialize user directory ? "
  if [[ $ok ]]; then
    prompt USER "Enter user$GREEN login$NORMAL:  $YELLOW"
    log "Initializing $GREEN home$NORMAL directory"
    mkdir -p /mnt/home/$USER/Desktop
    mkdir -p /mnt/home/$USER/Music
    mkdir -p /mnt/home/$USER/Videos
    mkdir -p /mnt/home/$USER/Pictures
    mkdir -p /mnt/home/$USER/Documents
    mkdir -p /mnt/home/$USER/Downloads
    log "Moving$GREEN flake$NORMAL to desktop directory"
    cp -r ./flake /mnt/home/$USER/Desktop/OS
    log "Initialization$GREEN successful"
  fi

  log "Thank you for using$BLUE NixOS by sashapop10"
}

main && exit 0
