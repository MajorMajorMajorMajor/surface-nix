{
    description = "Surface Pro NixOS";

    inputs = {
        # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        # nixpkgs.url = "path:/nix/var/nix/profiles/per-user/root/channels/nixos";
        nixpkgs.url = "path:/nix/store/i7yaqp51amk4k7mc0aanx05b3ar96hrq-nixos-25.11.9476.e07580dae397/nixos";
        nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    };

    outputs = { self, nixpkgs, nixos-hardware, ... }:
    let
        system = "x86_64-linux";
    in {
        nixosConfigurations.surface = nixpkgs.lib.nixosSystem {
            inherit system;
            modules = [
                ./configuration.nix
                ./hardware-configuration.nix

                # nixos-hardware.nixosModules.microsoft-surface-common
                # nixos-hardware.nixosModules.microsoft-surface-pro-intel

                # "${nixos-hardware}/microsoft/surface/common"
                # "${nixos-hardware}/microsoft/surface/surface-pro-intel"

                ({ pkgs, ...}: {
                    nix.settings.experimental-features = [ "nix-command" "flakes" ];

                    # microsoft-surface.ipts.enable = true;  # touchscreen

                    environment.systemPackages = with pkgs; [ 
                        vim 
                    ];
                })
            ];
        };
    };
}
