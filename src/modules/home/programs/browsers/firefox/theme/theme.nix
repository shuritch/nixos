{ config, ... }:

let
  c = config.my.home.colorscheme.colors
    // config.my.home.colorscheme.harmonized;
in {
  config.programs.firefox.profiles.dev-edition-default = let
    addRoot = path: ''
      :root {
        --my-surface: ${c.surface};
        --my-on_surface: ${c.on_surface};
        --my-surface_container: ${c.surface_container}
        --my-primary: ${c.primary};
        --my-on_primary: ${c.on_primary};
        --my-red: ${c.red};
      }

      ${builtins.readFile path}
    '';
  in { userChrome = addRoot ./userChrome.css; };
}
