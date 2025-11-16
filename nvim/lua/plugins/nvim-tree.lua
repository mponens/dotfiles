require('nvim-tree').setup({
	view = { relativenumber = true },
	update_focused_file = {
		enable = true,
		update_root = true, -- Optional: updates the root of the tree to the current file's directory
		ignore_list = {}, -- Optional: list of file patterns to ignore
	},
})
