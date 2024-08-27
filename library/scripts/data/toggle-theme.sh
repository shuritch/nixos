if [ -n "$1" ]; then
  theme="$1"
else
  current="$(${lib.getExe pkgs.jq} -re '.mode' "$HOME/.colorscheme.json")"
  if [ "$current" = "light" ]; then
    theme="dark"
  else
    theme="light"
  fi
fi

specialisation "$theme"
