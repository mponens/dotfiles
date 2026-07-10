-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config")
require("plugins")

vim.cmd([[
	if filereadable(expand('~/.vimrc'))
	  source ~/.vimrc
	endif
	let mapleader = ","
	map <Leader>t :NvimTreeToggle<Enter>
	map <Leader>ff :Telescope find_files<Enter>
	map <Leader>fd :Telescope lsp_workspace_symbols<Enter>
	map <Leader>fs :Telescope lsp_document_symbols<Enter>
	map <Leader>g  :Telescope  live_grep<Enter>
	map <Leader>r  :Telescope  resume<Enter>

	map <Leader>vc :VimuxPromptCommand<Enter>
	map <Leader>vr :VimuxRunLastCommand<Enter>
	map <Leader>vo :VimuxOpenRunner<Enter>
	map <Leader>vx :VimuxCloseRunner<Enter>

	set termguicolors
	colorscheme fogbell_light

]])

require('nvim-ts-autotag').setup()
