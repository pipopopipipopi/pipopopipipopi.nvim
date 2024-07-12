{ self, plugins, lib, stdenv, vimPlugins, }:
let
  envVars = plugins // {
    treesitter_parsers = lib.pipe (vimPlugins.nvim-treesitter.withPlugins
      (p: with p; [ c commonlisp cpp latex lua nix python rust vim ])).dependencies [
        (builtins.map builtins.toString)
        (builtins.concatStringsSep ",")
      ];
  };
in stdenv.mkDerivation (envVars // {
  pname = "pipopo-nvim-config";
  version = "latest";
  src = "${self}/nvim";

  installPhase = ''
    mkdir -p $out
    for file in $(find . -type f); do
      substituteAllInPlace "$file"
    done
    cp -r ./ $out
  '';
})
