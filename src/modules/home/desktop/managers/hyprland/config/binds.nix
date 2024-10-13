{ lib, config, ... }:

let
  cfg = config.my.home.desktop;
  w0-9 = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" ];
  wf1-f12 = [ "F1" "F2" "F3" "F4" "F5" "F6" "F7" "F8" "F9" "F10" "F11" "F12" ];
  workspaces = w0-9 ++ wf1-f12;
  directions = rec {
    left = "l";
    right = "r";
    up = "u";
    down = "d";
    h = left;
    l = right;
    k = up;
    j = down;
  };
in {
  config = lib.mkIf (cfg.enable && cfg.manager == "hyprland") {
    wayland.windowManager.hyprland.settings = {
      bindm = [ "SUPER,mouse:272,movewindow" "SUPER,mouse:273,resizewindow" ];
      bind = lib.concatLists [
        (lib.mapAttrsToList (k: v:
          "${lib.stringAsChars (x: if x != "+" then x else ",") k},exec,${v}")
          config.my.home.desktop.binds)

        (map (n: "SUPER,${n},workspace,name:${n}") workspaces)
        (map (n: "SUPERSHIFT,${n},movetoworkspacesilent,name:${n}") workspaces)
        (lib.mapAttrsToList (k: d: "SUPER,${k},movefocus,${d}") directions)
        (lib.mapAttrsToList (k: d: "SUPERSHIFT,${k},swapwindow,${d}")
          directions)
        (lib.mapAttrsToList (k: d: "SUPERALT,${k},focusmonitor,${d}")
          directions)
        (lib.mapAttrsToList
          (k: d: "SUPERALTSHIFT,${k},movecurrentworkspacetomonitor,${d}")
          directions)
        (lib.mapAttrsToList (k: d: "SUPERCONTROL,${k},movewindoworgroup,${d}")
          directions)

        [
          "SUPER,q,killactive"
          "SUPERSHIFT,q,killactive"
          "SUPERSHIFT,e,exit"

          "SUPER,s,togglesplit"
          "SUPER,f,fullscreen,1"
          "SUPERSHIFT,f,fullscreen,0"
          "SUPERSHIFT,space,togglefloating"
          "SUPERALT,p,exec,wl-copy $(hyprpicker)"

          "SUPER,minus,splitratio,-0.25"
          "SUPERSHIFT,minus,splitratio,-0.3333333"

          "SUPER,equal,splitratio,0.25"
          "SUPERSHIFT,equal,splitratio,0.3333333"

          "SUPER,g,togglegroup"
          "SUPER,t,lockactivegroup,toggle"
          "SUPER,tab,changegroupactive,f"
          "SUPERSHIFT,tab,changegroupactive,b"

          "SUPER,apostrophe,workspace,previous"
          "SUPERSHIFT,apostrophe,workspace,next"

          "SUPER,u,togglespecialworkspace"
          "SUPERSHIFT,u,movetoworkspacesilent,special"
          "SUPER,i,pseudo"
        ]
      ];
    };
  };
}
