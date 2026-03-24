{
        flake.nixosModules.init = { lib, pkgs, ... }: {
                options.programs.init = {
                        enable = lib.mkEnableOption "enable custom session init system";

                        package = lib.mkOption {
                                type = lib.types.package;
                                default = null;
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
