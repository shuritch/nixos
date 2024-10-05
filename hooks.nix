{ inputs, system, ... }: {
  pre-commit-check = inputs.pre-commit-hooks.lib.${system}.run {
    default_stages = [ "pre-commit" ];
    src = ./.;
    hooks = {
      nixfmt-classic.enable = true;
      end-of-file-fixer.enable = true;
      # shfmt.enable = true;
      check-added-large-files.enable = true;
      check-case-conflicts.enable = true;
      # check-executables-have-shebangs.enable = true;
      check-shebang-scripts-are-executable.enable = true;
      check-merge-conflicts.enable = true;
      detect-private-keys.enable = true;
      fix-byte-order-marker.enable = true;
      mixed-line-endings.enable = true;
      trim-trailing-whitespace.enable = true;

      forbid-submodules = {
        enable = true;
        name = "forbid submodules";
        description = "forbids any submodules in the repository";
        language = "fail";
        entry = "submodules are not allowed in this repository:";
        types = [ "directory" ];
      };

      destroyed-symlinks = {
        enable = true;
        name = "destroyed-symlinks";
        description =
          "detects symlinks which are changed to regular files with a content of a path which that symlink was pointing to.";
        package = inputs.pre-commit-hooks.checks.${system}.pre-commit-hooks;
        entry = "${
            inputs.pre-commit-hooks.checks.${system}.pre-commit-hooks
          }/bin/destroyed-symlinks";
        types = [ "symlink" ];
      };
    };
  };
}
