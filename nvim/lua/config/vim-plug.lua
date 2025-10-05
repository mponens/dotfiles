local nix = require("utils.nix")

-- Only setup vim-plug if plugins are not managed by Nix
if not nix.is_nix_managed() then
	vim.cmd([[
    let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
    if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath


    "plugins
    call plug#begin()
    " Plug 'scrooloose/nerdtree'
    " Plug 'wlangstroth/vim-racket'
    Plug 'tpope/vim-sensible'
    Plug 'nvim-tree/nvim-web-devicons' " optional
    Plug 'nvim-tree/nvim-tree.lua'

    Plug 'dracula/vim', {'as': 'dracula'}
	Plug 'chriskempson/base16-vim'
    Plug 'nordtheme/vim'
    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

    Plug 'neovim/nvim-lspconfig'
    Plug 'numToStr/Comment.nvim'
    Plug 'ellisonleao/glow.nvim'
    Plug 'preservim/vimux'

    Plug 'mfussenegger/nvim-jdtls'

    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'windwp/nvim-ts-autotag'

    Plug 'stevearc/conform.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " Plug 'wakatime/vim-wakatime'

    Plug 'christoomey/vim-tmux-navigator'

    Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
    Plug 'rafamadriz/friendly-snippets'

    Plug 'simrat39/rust-tools.nvim'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

    Plug 'olimorris/codecompanion.nvim'

    Plug 'echasnovski/mini.nvim'
    Plug 'MeanderingProgrammer/render-markdown.nvim'

	

	Plug 'MunifTanjim/nui.nvim'
	Plug 'xeluxee/competitest.nvim'

    call plug#end()
  ]])
else
	print("Plugins managed by Nix - skipping vim-plug setup")
end
