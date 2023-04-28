vim.api.nvim_exec ('language en_US', true)
require("rooc")
require("rose-pine").setup({
	groups = {
		panel = '#002200',
	}
})
vim.cmd('colorscheme rose-pine')
