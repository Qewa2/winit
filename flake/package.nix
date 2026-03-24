{
        perSystem = { pkgs, config, ... }: let
                        filePath = config.programs.init.defaults.filePath or "$HOME/.init.sh";
                        default = config.programs.init.defaults.script or "${pkgs.lib.getExe pkgs.bash}";
                in rec
                {
                        packages.default = packages.init;

                        packages.init = pkgs.writeShellApplication {
                                name = "init";

                                runtimeInputs = with pkgs; [ coreutils bash ];

                                extraShellCheckFlags = [ "-e" "SC1091" ];

                                text = ''
                                        #!${pkgs.bash}

                                        if [ -f "${filePath}" ]; then
                                                source "${filePath}"
                                        else
                                                echo -e "\e[31mERROR:\e[0m ${filePath} does NOT exist"
                                                echo "dropping you into a bash shell"
                                                sleep 0.5
                                                "${default}"
                                        fi
                                '';
                        };
                };
}
