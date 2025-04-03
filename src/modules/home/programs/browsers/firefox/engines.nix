{
  config.programs.firefox.profiles.dev-edition-default.search = {
    force = true;
    default = "google";
    privateDefault = "ddg";
    order = [ "google" "Yandex" ];
    engines = {
      "bing".metaData.hidden = true;
      "Yandex" = {
        definedAliases = [ "@ya" "@yandex" ];
        icon = "https://ya.ru/favicon.ico";
        urls = [{ template = "https://ya.ru/search?text={searchTerms}"; }];
      };

      "Youtube" = {
        definedAliases = [ "@you" "@youtube" ];
        icon = "https://youtube.ru/favicon.ico";
        urls = [{
          template = "https://youtube.com/results?search_query={searchTerms}";
        }];
      };

      "Nix Packages" = {
        definedAliases = [ "@pkgs" "@nixpkgs" ];
        icon = "https://nixos.org/favicon.png";
        urls = [{
          template = "https://search.nixos.org/packages?query={searchTerms}";
        }];
      };

      "Nix Options" = {
        definedAliases = [ "@opts" "@nixopts" ];
        icon = "https://nixos.org/favicon.png";
        urls = [{
          template = "https://search.nixos.org/options?query={searchTerms}";
        }];
      };

      "Nixvim" = {
        definedAliases = [ "@vim" "@nixvim" "@neo" "@nvim" ];
        icon = "https://nix-community.github.io/nixvim/favicon.svg";
        urls = [{
          template =
            "https://nix-community.github.io/nixvim?search={searchTerms}";
        }];
      };

      "Home Manager" = {
        definedAliases = [ "@hm" "@home" ];
        icon = "https://nixos.org/favicon.png";
        urls = [{
          template =
            "https://home-manager-options.extranix.com?query={searchTerms}";
        }];
      };

      "Github" = {
        definedAliases = [ "@git" "@github" ];
        icon = "https://github.githubassets.com/favicons/favicon-dark.svg";
        urls = [{
          template = "https://github.com/search?q={searchTerms}&type=code";
        }];
      };

      "Node" = {
        definedAliases = [ "@no" "@node" ];
        icon = "https://nodejs.org/static/images/favicons/favicon.png";
        urls = [{
          template = "https://nodejs.org/en/search?q={searchTerms}&section=all";
        }];
      };

      "MDN" = {
        definedAliases = [ "@mdn" "@js" ];
        icon =
          "https://developer.mozilla.org/favicon-48x48.bc390275e955dacb2e65.png";
        urls = [{
          template =
            "https://developer.mozilla.org/en-US/search?q={searchTerms}";
        }];
      };
    };
  };
}
