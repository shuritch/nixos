{ pkgs, ... }: {
  home.packages = with pkgs; [ hunspell hunspellDicts.ru_RU libreoffice-qt ];
}
