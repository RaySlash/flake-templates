{
  description = "Template repo for easy project init";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {pkgs, ...}: {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            git
            nix
          ];
        };
      };
      flake = {
        templates = {
          c = {
            path = ./templates/c;
            description = "A basic C dev environment";
          };
          c-raylib = {
            path = ./templates/c-raylib;
            description = "C with raylib dev environment";
          };
          elm = {
            path = ./templates/elm;
            description = "A elm dev environment";
          };
          rust = {
            path = ./templates/rust;
            description = "A rust dev environment";
          };
        };
      };
    };
}
