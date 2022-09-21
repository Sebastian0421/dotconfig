local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v", visual_block_mode = "x",
--   term_mode = "t", command_mode = "c",

keymap("", ";", ":", opts)
-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("i", "<C-h>", "<C-w>h", opts)
keymap("i", "<C-j>", "<C-w>j", opts)
keymap("i", "<C-k>", "<C-w>k", opts)
keymap("i", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>qj", "<C-w>j:q<CR>", opts)
keymap("n", "<leader>qk", "<C-w>k:q<CR>", opts)
keymap("n", "<leader>qh", "<C-w>h:q<CR>", opts)
keymap("n", "<leader>ql", "<C-w>l:q<CR>", opts)

keymap("n", "sk", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", opts)
keymap("n", "sj", ":set splitbelow<CR>:split<CR>", opts)
keymap("n", "sh", ":set nosplitbelow<CR>:vsplit<CR>:set splitright<CR>", opts)
keymap("n", "sl", ":set splitright<CR>:vsplit<CR>", opts)

-- tab
keymap("n", "tu", ":tabe<CR>", opts)
keymap("n", "th", ":-tabnext<CR>", opts)
keymap("n", "tl", ":+tabnext<CR>", opts)

-- NOTE: require winshit plugin
keymap("n", "<C-W>m", ":WinShift<cr>", opts)

-- i j remap to gi gj to get the consistent behaviour in wrap content mode (i.e. set wrap)
-- keymap("n", "j", "<Plug>(accelerated_jk_gj)", opts)
-- keymap("n", "k", "<Plug>(accelerated_jk_gk)", opts)

-- text edit
keymap("n", "J", "15j", opts)
keymap("n", "K", "15k", opts)
keymap("v", "J", "15j", opts)
keymap("v", "K", "15k", opts)
keymap("n", "Q", ":q<cr>", opts)
keymap("n", "S", ":w<cr>", opts)
keymap("n", "<", "<<", opts)
keymap("n", ">", ">>", opts)

-- buffer
keymap("n", "[b", ":bp<CR>", opts)
keymap("n", "]b", ":bn<CR>", opts)

-- 注释
keymap("n", "<leader>cc", ":CommentToggle<CR>", opts)
keymap("v", "<leader>cc", ":CommentToggle<CR>", opts)

-- FileExpoler
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>f", ":NvimTreeFindFile<cr>", opts)
-- no highlight
keymap("n", "<leader><CR>", ":nohl<cr>", opts)
-- save buffer
-- keymap("n", "<leader>w", ":w<cr>", opts)
-- exit cur buffer
keymap("n", "<leader>b", ":bdelete<cr>", opts)
-- delete cur buffer
-- keymap("n", "<leader>d", ":bdelete<cr>", opts)
-- keymap("n", "<leader>D", ":bdelete<cr>", opts)
-- exit whole program
keymap("n", "ZZ", ":lua require('user.utils').SaveAndExit()<cr>", opts)
-- remap macro record key
-- keymap("n", "Q", "q", opts)
-- cancel q
keymap("n", "q", "<Nop>", opts)
keymap("n", "s", "<ESC>", opts)

-- center cursor
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
-- keymap("n", "J", "mzJ`z", opts)
-- keymap("n", "j", "jzz", opts)
-- keymap("n", "k", "kzz", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
-- keymap("n", "R", ":bnext<CR>", opts)
-- keymap("n", "E", ":bprevious<CR>", opts)
-- NOTE: E/R navigation needs  'bufferline' plugin
keymap("n", "R", ":BufferLineCycleNext<CR>", opts)
keymap("n", "E", ":BufferLineCyclePrev<CR>", opts)

-- localhistorytoggle
keymap("n", "<leader>l", ":LocalHistoryToggle<CR>", opts)

-- Navigate line
keymap("n", "H", "^", opts)
keymap("n", "L", "$", opts)
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jl fast to enter
keymap("i", "jl", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)


-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<Space>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<Space>f", "<cmd>lua require('telescope').extensions.frecency.frecency(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<Space>F", "<cmd>Telescope live_grep<cr>", opts)

-- bookmark's
keymap("n", "ma", "<cmd>Telescope vim_bookmarks current_file<cr>", opts)
keymap("n", "mA", "<cmd>Telescope vim_bookmarks all<cr>", opts)


keymap("n", "<A-o>", "<cmd>ClangdSwitchSourceHeader<cr>", opts)
keymap("n", "<leader>u", "<cmd>Trouble lsp_references<cr>", opts)

-- calltree
keymap("n", "<leader>in", "<cmd>lua vim.lsp.buf.incoming_calls()<cr>", opts)

-- debug
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opts)
-- keymap("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opts)
keymap("n", "<leader>dl", "lua require'dap'.run_last()<cr>", opts)
keymap('n', '<F10>', '<cmd>lua require"user.dap.dap-util".reload_continue()<CR>', opts)
keymap("n", "<F4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<F7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<F8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- git diff view
keymap('n', '<leader>j', ']c', opts)
keymap('n', '<leader>k', '[c', opts)

-- unit test
keymap("n", "<leader>rr", "<cmd>UltestNearest<cr>", opts)
keymap("n", "<leader>rd", "<cmd>UltestDebugNearest<cr>", opts)

-- comment
keymap("n", "gcf", "<cmd>Dox<cr>", opts)

-- sniprun
keymap("n", "<leader>rf", ":%SnipRun<cr>", opts)
keymap("v", "<leader>rs", ":%SnipRun<cr>", opts)

-- spell check
vim.cmd(
[[
  nnoremap <leader>s :call search('\w\>', 'c')<CR>a<C-X><C-S>
]])

-- gtags
-- find functions calling this function
keymap("n", "<leader>U", ":lua require('user.utils').GtagsRefernce()<cr>", opts)
-- find definition
keymap("n", "<leader>T", ":lua require('user.utils').GtagsText()<cr>", opts)
