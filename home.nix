{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      gnumake
      atuin
      bat
      commitizen
      eza
      fd
      fishPlugins.done
      fishPlugins.fzf-fish
      fishPlugins.forgit
      fzf
      ripgrep
      httpie
      lua
      wl-clipboard
      tealdeer
      nodejs
      nix-your-shell
      dust
    ];

    #Set to username
    username = "john";
    homeDirectory = "/home/john";
    sessionVariables = {
      # VAULT_ADDR = "https://my-secret-location";
    };

    # do not ever change this after the first build.
    stateVersion = "24.05";
  };
  programs.bash.enable = true;
  programs.bash.initExtra = ''
    eval "$(direnv hook bash)"
  '';
  programs.fish.enable = true;
  programs.fish.interactiveShellInit = ''
    if command -q nix-your-shell
      nix-your-shell fish | source
    end
    if command -q atuin
      atuin init fish | source
    end
  '';
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    extraConfig = ''
      set number relativenumber
    '';

  };
  programs.atuin = {
    enable = true;
    settings = {
    };
  };
  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
