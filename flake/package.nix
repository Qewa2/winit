{
        perSystem = { pkgs, config, ... }: rec {
                packages.default = packages.init;
                packages.init = pkgs.writeShellApplication {
                        name = "init";

                        runtimeInputs = with pkgs; [
                                coreutils
                        ];

                        extraShellCheckFlags = [ "-e" "SC1091" ];

                        text = ''
                                #!${pkgs.bash}


                                if [ -f "$HOME/.init" ]; then
                                        source "$HOME/.init.sh"
                                else
                                        echo "$HOME/.init.sh does NOT exist"
                                fi
                        '';
                };
        };
}
