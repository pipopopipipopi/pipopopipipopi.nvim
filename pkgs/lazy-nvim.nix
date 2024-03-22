# lazy.nvim reads plugin configs from $HOME/.config/nvim via vim.fn.stdpath("config")
# This modified lazy.nvim refers to $MY_CONFIG_PATH instead of it
# I set Nix store path of my neovim config to $MY_CONFIG_PATH
{ stdenv, vimUtils, fetchFromGitHub, }:
let
  modifiedSrc = stdenv.mkDerivation {
    name = "modified-lazy.nvim-source";
    src = fetchFromGitHub {
      owner = "folke";
      repo = "lazy.nvim";
      rev = "83493db50a434a4c5c648faf41e2ead80f96e478";
      hash = "sha256-XDHqFe48WdqXBIPVmr0wymngVif5wsk2SAokJU3TOl0=";
    };
    installPhase = ''
      mkdir -p $out
      for file in $(find . -type f); do
        substituteInPlace "$file" \
          --replace vim.fn.stdpath\(\"config\"\) vim.fn.expand\(\"\$MY_CONFIG_PATH\"\)
      done
      cp -r ./ $out
    '';
  };
in vimUtils.buildVimPlugin {
  name = "lazy.nivm";
  src = modifiedSrc;
}
