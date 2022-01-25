local signs = { Error = '✘', Warn = '', Hint = '', Info = 'ⁱ'}
	for type, icon in pairs(signs) do
		local hl = 'DiagnosticSign' .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
	end

