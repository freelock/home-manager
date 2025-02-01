# home-manager
Home Manager config

This is essentially the home manager configuration I use everywhere. My real one sets a few session variables for other specific tools -- but otherwise this reflects what I'm using in January 2025.

## What does this configuration do?

This basically provides a bunch of really nice shell improvements:

- Sets your account to use Fish shell
- Configures Direnv to be active
- Adds Atuin for a powerful, searchable shell history
- Adds fzf for active file path search and other tools
- Activates Starship prompt, which shows a lot of context about your shell's context
- Adds forgit shortcuts

In addition, there's a bunch of handy tools that often improve on others already available:

- bat, a replacement for cat, less, for viewing files
- http (httpie) -- a cli http tool like wget/curl, but optimized for api calls
- rg (ripgrep) -- fast recursive grep
- tldr (tealdeer) -- a shortened version of man pages, focused around example usage
- dust -- view relative disk usage of a directory
- NeoVim -- a modern update to Vim
- cz (commitizen) -- conventional commits


## To use this configuration

1. Clone this repository: `git clone https://github.com/freelock/home-manager.git
2. Change the username in both the flake.nix (line 22) and home.nix (line 26). Also set the correct home directory path in line 27.
3. Install Nix (unless it's already installed) - https://nixos.org/download/, or https://determinate.systems/nix-installer/ .
4. Make home-manager available - `nix-shell -p home-manager`
5. Activate this home-manager configuration - `home-manager switch --flake .#john` (instead of john, use the name you set in the flake.nix). If you have this set to match your login, you can omit the --flake and just do `home-manager switch`.
6. Log out, and then log back in again.

... that's the gist! Read on for common issues.

## Which installer should I use?

I think at the end of the day, either should be fine -- I've only used the one from nixos.org. The key difference is "flakes". Nix flakes are a newer feature that after several years is still considered experimental, and so it's still not active in the Nixos installer -- and yet flakes are in widespread use, and I use them extensively.

So if you use the Nixos installer, you also need to follow the instructions to make then available -- easiest is to add the line

```
experimental-features = nix-command flakes
```
to /etc/nix/nix.conf (in non-NixOS hosts) or to /etc/nixos/configuration.conf in Nixos.

If you use the Determinate Systems installer Nix flakes are enabled by default.

## I got an error when activating home-manager

The main one I've gotten is an error about having an existing ~/.config/fish/config.fish . If you have something you want to preserve from a file that Home Manager wants to manage, you can copy that configuration into the home.nix file, and then Home Manager will manage that for you. You can then just delete the file that's in the way and repeat the `home-manager switch` command.

## Updating

To update, run `nix flake update --commit-lock-file`. This updates the flake.lock after downloading the current nixpkgs repository, and automatically commits it to git. Then repeat the `home-manager switch` command to apply the new versions.
