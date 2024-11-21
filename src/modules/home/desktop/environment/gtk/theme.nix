{ config, lib, pkgs, ... }:

let cfg = config.my.home.desktop;
in {
  config.gtk.theme = let
    inherit (builtins) hashString toJSON;
    inherit (config.my.home.colorscheme) colors mode;
    name = "generated-${hashString "md5" (toJSON colors)}-${mode}";
    c = (lib.mapAttrs (_: v: lib.removePrefix "#" v) colors);
  in lib.mkIf cfg.enable {
    inherit name;
    package = pkgs.stdenv.mkDerivation {
      name = "generated-gtk-theme";
      phases = [ "unpackPhase" "installPhase" ];
      src = pkgs.fetchFromGitHub {
        owner = "nana-4";
        repo = "materia-theme";
        rev = "76cac96ca7fe45dc9e5b9822b0fbb5f4cad47984";
        sha256 = "sha256-0eCAfm/MWXv6BbCl2vbVbvgv8DiUH09TAUhoKq7Ow0k=";
      };

      buildInputs = [
        pkgs.sassc
        pkgs.bc
        pkgs.which
        pkgs.meson
        pkgs.ninja
        pkgs.nodePackages.sass
        pkgs.gtk4.dev
        pkgs.optipng
        (pkgs.runCommand "rendersvg" { } ''
          mkdir -p $out/bin
          ln -s ${pkgs.resvg}/bin/resvg $out/bin/rendersvg
        '')
      ];

      installPhase = ''
        HOME=/build
        chmod 777 -R .
        patchShebangs .
        mkdir -p $out/share/themes
        mkdir bin
        sed -e 's/handle-horz-.*//' -e 's/handle-vert-.*//' -i ./src/gtk-2.0/assets.txt

        cat > /build/gtk-colors << EOF
          BTN_BG=${c.primary_container}
          BTN_FG=${c.on_primary_container}
          BG=${c.surface}
          FG=${c.on_surface}
          HDR_BTN_BG=${c.secondary_container}
          HDR_BTN_FG=${c.on_secondary_container}
          ACCENT_BG=${c.primary}
          ACCENT_FG=${c.on_primary}
          HDR_BG=${c.surface_bright}
          HDR_FG=${c.on_surface}
          MATERIA_SURFACE=${c.surface_bright}
          MATERIA_VIEW=${c.surface_dim}
          MENU_BG=${c.surface_container}
          MENU_FG=${c.on_surface}
          SEL_BG=${c.primary_fixed_dim}
          SEL_FG=${c.on_primary}
          TXT_BG=${c.primary_container}
          TXT_FG=${c.on_primary_container}
          WM_BORDER_FOCUS=${c.outline}
          WM_BORDER_UNFOCUS=${c.outline_variant}
          UNITY_DEFAULT_LAUNCHER_STYLE=False
          NAME=${name}
          MATERIA_STYLE_COMPACT=True
        EOF

        echo "Changing colours:"
        ./change_color.sh -o ${name} /build/gtk-colors -i False -t "$out/share/themes"
        chmod 555 -R .
      '';
    };
  };
}
