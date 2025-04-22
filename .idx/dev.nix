{pkgs, ...}: {
  channel = "stable-24.11";
  packages = with pkgs; [
    neovim
    ripgrep
    rm-improved
    bat
  ];
  env = {};
  idx = {
    # check extensions on https://open-vsx.org/
    extensions = [
      "asvetliakov.vscode-neovim"
    ];
    # Enable previews and customize configuration
    previews = {};
  };
}