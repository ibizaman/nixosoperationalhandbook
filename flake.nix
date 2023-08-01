{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ self, nixpkgs, ... }:
    {
      nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./machines/workstation.nix
        ];
      };

      colmena = {
        meta = {
          inherit nixpkgs;
          specialArgs = inputs;
        };

        server1 = import ./machines/server1.nix;
      };
    };
}
