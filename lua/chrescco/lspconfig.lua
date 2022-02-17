
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end
local on_attach = function(client, bufnr)
 	buf_map(0, "n", "R", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
	buf_map(0, "n", "A", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
	buf_map(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
	buf_map(0, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
	buf_map(0, "n", "D", "<cmd>Lspsaga show_cursor_diagnostics<cr>", {silent = true, noremap = true})
	buf_map(0, "n", "N", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
	buf_map(0, "n", "P", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
	buf_map(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")
	buf_map(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
	buf_map(0, "n", "F", "<cmd>lua require('lspsaga.action').lsp_finder<cr>", {silent = true, noremap = true})
	
	if client.resolved_capabilities.document_formatting then
        vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    end
end

local servers = { 'pyright', 'clangd', 'html', 'tsserver', 'sumneko_lua', 'vimls' }

require'lspconfig'.html.setup {
  filetypes = {"html", "eruby"},
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
})
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
    },
    on_attach = on_attach,
})

 local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
 require('lspconfig').tsserver.setup {
      capabilities = capabilities
    }
