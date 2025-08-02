local M = {}

function M.is_nix_managed()
  return vim.g.nix_managed_plugins or 
         vim.fn.has('nixos') == 1 or 
         os.getenv('NIX_STORE') ~= nil or
         vim.fn.filereadable('/etc/NIXOS') == 1
end
return M
