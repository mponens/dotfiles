vim.api.nvim_create_autocmd("FileType", {
  pattern = "html,css,javascript",
  callback = function()
    vim.opt_local.shiftwidth = 2
  end
})
