{
  description = "Development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [
          pkgs.nodejs_20
          pkgs.nodePackages.yarn
        ];

        NODE_ENV = "development";
        
        shellHook = ''
          export PATH="${pkgs.nodejs_20}/bin:$PATH"
          export PATH="${pkgs.nodePackages.yarn}/bin:$PATH"
        '';
      };
    };
}
