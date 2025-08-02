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
})
