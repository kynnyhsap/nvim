local options = {
  wrap = false,
  number = true,

  -- Indenting
  expandtab = true,
  shiftwidth = 2,
  smartindent = true,
  tabstop = 2,
  softtabstop = 2,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end


