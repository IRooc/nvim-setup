local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>gs', vim.cmd.Git);
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {});
vim.keymap.set('n', '<leader>w', ':set wrap!<CR>');

vim.keymap.set("n", "<leader>b", ':Buffish<cr>');
-- greatest remap ever preserves the current copy buffer
vim.keymap.set("x", "<leader>p", "\"_dP")
-- remap C-v to leader-v because of paste....
vim.keymap.set('n', '<leader>v', '<c-v>')
---keymaps from windows
vim.keymap.set("i", "<C-z>", vim.cmd.undo);
vim.keymap.set("i", "<C-v>", '<ESC>"+pa'); --paste from clipboard
vim.keymap.set("v", "<C-c>", '"+yi');      --copy to clipboard

vim.keymap.set("i", "<C-s>", vim.cmd.update);
vim.keymap.set("n", "<C-s>", vim.cmd.update);
vim.keymap.set("n", "<C-i>", vim.diagnostic.open_float);

vim.keymap.set("n", "<leader>t", "<C-w>w"); --switch buffer
vim.keymap.set("n", "<leader>sv", "<C-w>v"); --split vertical
vim.keymap.set("n", "<leader>sh", "<C-w>s"); --split horizontal

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>");
vim.keymap.set("n", "<leader>f", ":NvimTreeFindFile<CR>");
