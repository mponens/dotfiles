local M = {}

function M.is_nix_managed()
  return vim.g.nix_managed_plugins == true
end
return M
