local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>gs', vim.cmd.Git);

vim.keymap.set("n", "<leader>b", ':SwitchBuffer <cr>');
-- greatest remap ever preserves the current copy buffer
vim.keymap.set("x", "<leader>p", "\"_dP")
---keymaps
vim.keymap.set("i", "<C-z>", vim.cmd.undo);
vim.keymap.set("i", "<C-s>", vim.cmd.update);
vim.keymap.set("n", "<C-s>", vim.cmd.update);
vim.keymap.set("n", "<leader>t", "<C-w>w");

