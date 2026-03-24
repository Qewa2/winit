{ self, ... }: {
        flake.nixosModules.init = { lib, pkgs, ... }: {
                options.programs.init = {
                        enable = lib.mkOption {
                                type = lib.types.bool;
                                default = false;
                                description = "wether to enable the program or not";
                        };

                        package = lib.mkOption {
                                type = lib.types.package;
                                default = self.packages.init;
                                description = "init package to use";
                        };

                        defaults = {
                                initFile = lib.mkOption {
                                        type = lib.types.str;
                                        defualt = ''
                                                ${pkgs.bash}
                                        '';
                                };
                        };
                };
        };

        flake.homeModules.init = {

        };
}
