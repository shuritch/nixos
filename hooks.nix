{ inputs, system, ... }:

# https://github.com/cachix/git-hooks.nix
let hooks = inputs.pre-commit-hooks;
in {
  pre-commit-check = hooks.lib.${system}.run {
    default_stages = [ "pre-commit" ];
    src = ./.;
    hooks = {
      shfmt.enable = true;
      deadnix.enable = true;
      nixfmt-classic.enable = true;
      end-of-file-fixer.enable = true;
      check-added-large-files.enable = true;
      check-case-conflicts.enable = true;
      check-merge-conflicts.enable = true;
      detect-private-keys.enable = true;
      fix-byte-order-marker.enable = true;
      mixed-line-endings.enable = true;
      trim-trailing-whitespace.enable = true;

      check-shebang-scripts-are-executable = {
        enable = true;
        types = [ "sh" ];
        excludes = [ ".vscode" ".github" ];
      };

      check-executables-have-shebangs = {
        enable = true;
        types = [ "sh" ];
        excludes = [ ".vscode" ".github" ];
      };

      forbid-submodules = {
        enable = true;
        name = "forbid submodules";
        description = "forbids any submodules in the repository";
        entry = "submodules are not allowed in this repository:";
        types = [ "directory" ];
        language = "fail";
      };

      destroyed-symlinks = {
        enable = true;
        name = "destroyed-symlinks";
        types = [ "symlink" ];
        description = "Detects symlinks which are changed to regular files.";
        package = hooks.checks.${system}.pre-commit-hooks;
        entry =
          "${hooks.checks.${system}.pre-commit-hooks}/bin/destroyed-symlinks";
      };
    };
  };
}
