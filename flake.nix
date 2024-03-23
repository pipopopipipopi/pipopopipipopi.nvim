{
  description = "pipopo's neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    # colorscheme
    rose_pine = {
      url = "github:rose-pine/neovim";
      flake = false;
    };

    # telescope
    telescope_nvim = {
      url = "github:nvim-telescope/telescope.nvim";
      flake = false;
    };
    plenary_nvim = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };
    telescope_file_browser_nvim = {
      url = "github:nvim-telescope/telescope-file-browser.nvim";
      flake = false;
    };

    # cmp
    nvim_cmp = {
      url = "github:hrsh7th/nvim-cmp";
      flake = false;
    };
    cmp_nvim_lsp = {
      url = "github:hrsh7th/cmp-nvim-lsp";
      flake = false;
    };
    cmp_buffer = {
      url = "github:hrsh7th/cmp-buffer";
      flake = false;
    };
    cmp_cmdline = {
      url = "github:hrsh7th/cmp-cmdline";
      flake = false;
    };
    cmp_path = {
      url = "github:hrsh7th/cmp-path";
      flake = false;
    };
    cmp_luasnip = {
      url = "github:saadparwaiz1/cmp_luasnip";
      flake = false;
    };
    lua_snip = {
        url = "github:L3MON4D3/LuaSnip";
        flake = false;
    };

    # lsp
    nvim_lspconfig = {
      url = "github:neovim/nvim-lspconfig";
      flake = false;
    };
    lspsaga_nvim = {
      url = "github:nvimdev/lspsaga.nvim";
      flake = false;
    };
    lspkind_nvim = {
      url = "github:onsails/lspkind.nvim";
      flake = false;
    };

    # autopairs
    nvim_autopairs = {
      url = "github:windwp/nvim-autopairs";
      flake = false;
    };

    # terminal
    toggleterm_nvim = {
      url = "github:akinsho/toggleterm.nvim";
      flake = false;
    };

    # start ui
    alpha_nvim = {
      url = "github:goolord/alpha-nvim";
      flake = false;
    };

    # ui
    lualine_nvim = {
        url = "github:nvim-lualine/lualine.nvim";
        flake = false;
    };
    nvim_web_devicons = {
        url = "github:nvim-tree/nvim-web-devicons";
        flake = false;
    };
    noice_nvim = {
        url = "github:folke/noice.nvim";
        flake = false;
    };
    nui_nvim = {
        url = "github:MunifTanjim/nui.nvim";
        flake = false;
    };
  };

  outputs = inputs@{ self, nixpkgs, flake-utils, ... }:
    let
      allSystems = [
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-linux" # 64-bit x86 Linux
        "aarch64-darwin" # 64-bit ARM macOS
        "x86_64-darwin" # 64-bit x86 macOS
      ];
      forAllSystems = inputs.nixpkgs.lib.genAttrs allSystems;
    in {
      formatter =
        forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt);
      packages = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          lib = pkgs.lib;

          # Vim plugin sources
          vimPluginInputs =
            builtins.removeAttrs inputs [ "nixpkgs" "flake-utils" ];

          # Vim plugins
          plugins = (builtins.mapAttrs (name: value:
            pkgs.vimUtils.buildVimPlugin {
              pname = name;
              version = "latest";
              src = value;
            }) vimPluginInputs) // {
              nvim_treesitter = pkgs.vimPlugins.nvim-treesitter;
              lazy_nvim = pkgs.callPackage ./pkgs/lazy-nvim.nix { };
            };

          mainDevTools = with pkgs; [
            # For telescope.nvim
            ripgrep
            # Git TUI
            lazygit

            # C/C++
            clang-tools
            # Lua
            lua-language-server
            stylua
            # Nix
            nixfmt
            nil
            # Python
            ruff
            pyright
            # Rust
            rust-analyzer
          ];

          subDevTools = with pkgs;
            [
              # HTML/CSS
              nodePackages.vscode-langservers-extracted
            ];

          nvimConfig = pkgs.callPackage ./config.nix { inherit self plugins; };
          neovim-base =
            pkgs.neovim-unwrapped.override { treesitter-parsers = { }; };
          nvimWrapped = extraPackages:
            pkgs.writeShellScriptBin "nvim" ''
              PATH=$PATH:${lib.makeBinPath extraPackages}
              MY_CONFIG_PATH=${nvimConfig} ${neovim-base}/bin/nvim -u ${nvimConfig}/init.lua "$@"
            '';
        in rec {
          default = neovim-full;
          neovim-full = nvimWrapped (mainDevTools ++ subDevTools);
          neovim-light = nvimWrapped mainDevTools;
          neovim-minimal = nvimWrapped [ ];
          config = nvimConfig;
        });
    };
}
