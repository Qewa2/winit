{
        perSystem = { pkgs, config, ... }: let
                        filePath = config.programs.init.defaults.filePath or "$HOME/.init.sh";
                in rec
                {
                        packages.default = packages.init;

                        packages.init = pkgs.writeShellApplication {
                                name = "init";

                                runtimeInputs = with pkgs; [ coreutils ];

                                extraShellCheckFlags = [ "-e" "SC1091" ];

                                text = ''
                                        #!${pkgs.bash}

                                        if [ -f "${filePath}" ]; then
                                                source "${filePath}"
                                        else
                                                echo "${filePath} does NOT exist"
                                        fi
                                '';
                        };
                };
}
