local nix = require("utils.nix")


require 'nvim-treesitter.configs'.setup {
	ensure_installed = nix.is_nix_managed() and {} or {
		"lua", "vim", "vimdoc", "query", "rust", "javascript", "typescript",
		"python", "java", "html", "css", "json", "markdown", "bash", "nix"
	},
	highlight = {
		enable = false,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	}
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
