require("codecompanion").setup({
	display = {
		chat = {
			window = {
				position = "right",
			},
		},
	},
	strategies = {
		chat = {
			adapter = "gemini",
		},
		inline = {
			adapter = "gemini",
		},
	},
	adapters = {
		gemini = function()
			return require("codecompanion.adapters").extend("gemini", {
				env = {
					api_key = "cmd:cat /run/secrets/api-keys/gemini-api-key",
				},
			})
		end,
	},

})
