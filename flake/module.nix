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
                                filePath = lib.mkOption {
                                        type = lib.types.str;
                                        default = "$HOME/.init.sh";
                                };
                                
                                script = lib.mkOption {
                                        type = lib.types.str;
                                        default = "${pkgs.lib.getExe pkgs.bash}";
                                        description = "script to be called incase the file isn't found";
                                };
                        };
                };
        };
}
