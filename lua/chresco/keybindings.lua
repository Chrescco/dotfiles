local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true }

local function nkeymap(key, map)
    keymap('n', key, map, opts)
end

nkeymap("R", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
nkeymap("gx", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
nkeymap("gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
nkeymap("K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
nkeymap("D", "<cmd>Lspsaga show_cursor_diagnostics<cr>", {silent = true, noremap = true})
nkeymap("N", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
nkeymap("P", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
nkeymap("<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")
nkeymap("<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
nkeymap("CA", "<cmd>lua require('lspsaga.action').code_action<cr>", {silent = true, noremap = true})
