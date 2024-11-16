{
  # description = "My system configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
    };
  };
  outputs = {
    nixpkgs,
    flake-parts,
    ...
  } @ inputs: let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
    stateVersion = "24.05";
    system = "x86_64-linux";
    helpers = import ./lib/helpers.nix {inherit inputs stateVersion;};
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [system];
      flake = {
        nixosConfigurations = {
          io = helpers.mkHost {
            hostname = "io";
            user = "killitar";
          };
        };

        homeConfigurations = {
          "killitar" = helpers.mkHome {user = "killitar";};
        };

        devShells.x86_64-linux.default = pkgs.mkShell {
          packages = with pkgs; [alejandra nil deadnix sops];
          name = "ღვინო";
          meta.description = "The default development shell for this flake";

          shellHook = ''
              clear
              echo "
                  ________    ___    __ __ ______
                 / ____/ /   /   |  / //_// ____/
                / /_  / /   / /| | / ,<  / __/
               / __/ / /___/ ___ |/ /| |/ /___
              /_/   /_____/_/  |_/_/ |_/_____/
            "  | ${pkgs.clolcat}/bin/clolcat
          '';
        };
      };
    };
}
