local jdtls = require('jdtls')
local extendedClientCapabilities = jdtls.extendedClientCapabilities

-- https://blog.jenkster.com/2025/06/neovim-lsp-and-nix.html
local config = {
	cmd = { '/usr/bin/env', 'jdtls' },
	root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
	init_options = {
		settings = {
			java = {
				imports = {
					gradle = {
						enabled = true,
						wrapper = {
							enabled = true,
							-- Note the nested table here. This is really important.
							-- `checksums` is an array of objects, which in lua translates to a table of tables.
							checksums = {
								{
									sha256 = '7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172',
									allowed = true,
								},
							},
						},
					},
				},
			},
		},
	},
}
jdtls.start_or_attach(config)
