{
        perSystem = { pkgs, config, ... }: let
                        filePath = config.programs.winit.defaults.filePath or "$HOME/.init.sh";
                        default = config.programs.winit.defaults.script or "${pkgs.lib.getExe pkgs.bash}";
                in rec
                {
                        packages.default = packages.winit;

                        packages.winit = pkgs.writeShellApplication {
                                name = "winit";

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
