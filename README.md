# winit
my custom session init system

you can include it like this:
```
{
        description = "A very basic flake";

        inputs = {
                nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

                winit = {
                        url = "github:Qewa2/init";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
        };
}

```

this will give you the following options:
```
programs.winit = {
        enable = true;

        package = inputs.winit.packages.winit;

        defaults = {
                filePath = "$HOME/.init.sh";
                script = "${pkgs.lib.getExe pkgs.bash}";
        };
};
```
(these are the defaults however you can change them)
