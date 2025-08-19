local M = {}
function M.is_nix_managed()
  return vim.g.nix_managed_plugins == true or 
         vim.fn.has('nixos') == 1 or 
         os.getenv('NIX_STORE') ~= nil
end
return M
