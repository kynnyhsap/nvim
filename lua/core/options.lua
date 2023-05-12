local options = {
    tabstop = 4,
    wrap = false,
    number = true
}

for k, v in pairs(options) do
    vim.opt[k] = v
end


