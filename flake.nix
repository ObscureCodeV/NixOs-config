{
	description = "My system";

	inputs = {
		nixpkgs.url = "github:NixOs/nixpkgs/nixos-26.05";

		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
	    };
	};

	outputs = {self, nixpkgs, home-manager, ...}:

	let
		system = "x86_64-linux";
  in {
    	nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
    		inherit system;
    		modules = [ ./nixos/configuration.nix ];
    	};
    	homeConfigurations.vanger = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.${system};
			modules = [ ./home-manager/home.nix ];
		};
	};
}
