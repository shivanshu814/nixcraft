{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs
    pkgs.nodePackages.yarn
  ];

  NODE_ENV = "development";

}
