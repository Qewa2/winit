{
        perSystem = { pkgs, config, ... }: {
                packages.init = pkgs.writeShellApplication {
                        name = "init";

                        runtimeInputs = with pkgs; [
                                coreutils
                        ];

                        text = ''
                                #!${pkgs.bash}


                                if [ -f $HOME/.init ]; then
                                        source $HOME/.init
                                else
                                        if [ ${config.programs.init.enable} == true]; then
                                                source ${config.programs.init.defaultFile}
                                        fi
                                fi
                        '';
                };
        };
}
