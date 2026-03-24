# init
my custom session init system

you can include it like this:
```
{
        description = "A very basic flake";

        inputs = {
                nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

                init = {
                        url = "github:Qewa2/init";
                        inputs.nixpkgs.follows = "nixpkgs";
                };
        };
}

```

this will give you the following options:
```
programs.init = {
        enable = true;

        package = inputs.init.packages.init;

        defaults = {
                filePath = "$HOME/.init.sh";
                script = "${pkgs.lib.getExe pkgs.bash}";
        };
};
```
(these are the defaults however you can change them)
