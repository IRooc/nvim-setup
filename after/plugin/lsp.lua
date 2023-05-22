local lsp = require('lsp-zero').preset({})

lsp.preset("recommended")

lsp.ensure_installed({
	'eslint',
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = {
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({ select = false }),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		-- Navigate between snippet placeholder
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	lsp.default_keymaps(opts)

	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').tsserver.setup({
	root_dir = require('lspconfig.util').root_pattern('.git')
})
lsp.skip_server_setup({ 'tsserver' })

lsp.setup()

require('typescript').setup({
	server = {
		on_attach = function(client, bufnr)
			-- You can find more commands in the documentation:
			-- https://github.com/jose-elias-alvarez/typescript.nvim#commands

			-- disable inline error texts
			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false
				}
			)
			vim.keymap.set('n', '<leader>ci', '<cmd>TypescriptAddMissingImports<cr>', { buffer = bufnr })
		end
	}
})
